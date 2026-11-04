
import math
import os
import hashlib
import re
import shutil
import tempfile
import threading
import uuid
import fcntl
import json
from contextlib import contextmanager, nullcontext
from pathlib import Path
from typing import List, Dict

from flask import Blueprint, current_app, request, session, jsonify, send_file
from flask_socketio import join_room
from werkzeug.utils import secure_filename

from interface import sio, UPLOAD_FOLDER, generate_id
from .pcb_coordinates import pad_position
from .pcb_import import load_pcb, ImportError as PCBImportError, MAX_FILE_BYTES
from .pcb_import import load_bytes
from .step_upload import (MAX_STEP_BYTES, MAX_MESH_BYTES, MAX_MANIFEST_BYTES,
                          save_upload, step_placements, match_placements, validate_mesh)

kicad_bp = Blueprint("kicad", __name__, url_prefix="/kicad")

SCHEMATICS_EXTENSION = ".kicad_sch"
LAYOUT_EXTENSION = ".kicad_pcb"

schematics_data = {}
layouts_data = {}
nets_data = {}
candidates_data = {}
edges_data = {}
pads_data = {}
dimensions_data = {}
import_info_data = {}
cache_lock = threading.RLock()


def emit_owned(event, data):
    sio.emit(event, data, to=session.get("user_id"))


@sio.on("connect")
def join_design_room():
    generate_id()
    join_room(session["user_id"])

@sio.on("get_schematics_path")
def get_schematics_path():
    user_id = session.get("user_id")
    load_files()

    if user_id in schematics_data:
        emit_owned("schematic", schematics_data[user_id]["schematics"])
    elif user_id:
        emit_owned("schematic", dict(pages=[],components=[]))

@sio.on("list_nets")
def list_nets():
    user_id = session.get("user_id")
    load_files()

    if user_id in nets_data:
        emit_owned("nets", nets_data[user_id])


@sio.on("list_edges")
def list_edges():
    user_id = session.get("user_id")
    load_files()

    if user_id in edges_data:
        emit_owned("edges", edges_data[user_id])


@sio.on("list_pads")
def list_pads():
    user_id = session.get("user_id")
    load_files()

    if user_id in pads_data:
        emit_owned("pads", pads_data[user_id])

@sio.on("list_dimensions")
def list_dimensions():
    user_id = session.get("user_id")
    load_files()

    if user_id in dimensions_data:
        emit_owned("dimensions", dimensions_data[user_id])

def parse_design(layout_path, schematic_path=None):
    if schematic_path is not None:
        raise PCBImportError('嘉立创V3工程已经包含原理图，请只上传一个.epro2工程。')
    board = load_pcb(layout_path)
    schematic = board.get('schematic', {})
    nets, edges, pads, dimensions = (board[k] for k in ('nets','edges','pads','dimensions'))
    info = dict(format=board['format'],pads=len(pads),nets=len(nets),
                selectable_top_pads=sum(p['is_allowed'] for p in pads.values()),
                metadata=board['metadata'],warnings=board['warnings'],
                schematic_pages=len(schematic.get('pages',[])),
                schematic_components=len(schematic.get('components',[])),
                width_mm=dimensions['width'],height_mm=dimensions['height'])
    return board, schematic, nets, edges, pads, dict(dimensions,import_info=info), info


def publish_design(parsed, schematic_path):
    board, schematic, nets, edges, pads, dimensions, info = parsed
    user = session["user_id"]
    with cache_lock:
        layouts_data[user] = board
        schematics_data[user] = dict(schematics=schematic, path=schematic_path)
        nets_data[user], edges_data[user], pads_data[user] = nets, edges, pads
        dimensions_data[user], import_info_data[user] = dimensions, info
        candidates_data.pop(user, None)
    try:
        emit_owned("schematic", schematic)
        for event, data in (("nets", nets), ("edges", edges), ("pads", pads),
                            ("dimensions", dimensions), ("pcb_import_info", info)):
            emit_owned(event, data)
    except (OSError, RuntimeError):
        current_app.logger.warning('工程已保存，实时视图推送暂不可用。')


def stored_path(relative):
    root = user_folder()
    path = (root / relative).resolve()
    if root not in path.parents:
        raise ValueError("上传文件路径无效。")
    return path


def user_folder():
    user = session["user_id"]
    if not isinstance(user, str) or not re.fullmatch(r"[A-Za-z0-9_-]{1,100}", user):
        raise ValueError("上传会话编号无效。")
    base = Path(UPLOAD_FOLDER).resolve()
    root = (base / user).resolve()
    if root.parent != base:
        raise ValueError("上传目录无效。")
    return root


def same_origin_upload():
    from urllib.parse import urlsplit
    origin = request.headers.get('Origin')
    return (not origin or (urlsplit(origin).scheme, urlsplit(origin).netloc) ==
            (request.scheme, request.host))


@contextmanager
def import_commit_guard(service):
    with getattr(service, '_lock', nullcontext()):
        if service is not None and service.status()['busy']:
            raise BlockingIOError('电机任务执行期间不能更换PCB，请等待完成。')
        runtime = getattr(service, 'runtime', None)
        if runtime is None:
            yield
            return
        runtime = Path(runtime)
        runtime.mkdir(parents=True, exist_ok=True)
        with (runtime / 'active.lock').open('a') as handle:
            try:
                fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                raise BlockingIOError('已有任务或版本更新正在执行，请稍后重新导入。') from None
            yield


def binding_index(root):
    try:
        path = root / 'step_bindings.json'
        if path.stat().st_size > 1048576:
            return {}
        value = json.loads(path.read_text(encoding='utf-8'))
        return value if isinstance(value, dict) else {}
    except (OSError, ValueError):
        return {}


def attach_step_model(parsed, relative):
    path = stored_path(relative)
    if not re.fullmatch(r'design_[a-f0-9]{32}/step/model.json', relative):
        raise ValueError('STEP模型路径无效。')
    if path.stat().st_size > MAX_MANIFEST_BYTES:
        raise ValueError('STEP模型清单过大。')
    model = json.loads(path.read_text(encoding='utf-8'))
    board, _, _, _, _, dimensions, info = parsed
    if model.get('layout_id') != dimensions['layout_id'] or model.get('binary') != 'meshes.bin' or (path.parent / 'meshes.bin').stat().st_size != model.get('binary_bytes'):
        raise ValueError('已保存的STEP与当前工程不匹配。')
    generation = Path(relative).parts[0]
    entry = {key: model[key] for key in ('layout_id', 'source', 'source_sha256', 'units', 'width_mm', 'height_mm', 'component_count', 'missing_references')}
    entry['manifest_url'] = '/kicad/step_model/%s/model.json' % generation
    entry['alignment'] = model.get('alignment', {})
    board['step_model'] = entry
    info['step_model'] = entry


@kicad_bp.route('/inspect_project', methods=['POST'])
def inspect_project():
    generate_id()
    if not same_origin_upload() or request.headers.get('X-Requested-With') != 'XMLHttpRequest':
        return jsonify(error='仅接受当前网页的工程检查请求。'), 403
    service = current_app.extensions.get('motor_service')
    if service is not None and service.status()['busy']:
        return jsonify(error='电机任务执行期间不能更换PCB。'), 409
    upload = request.files.get('layout_file')
    if upload is None or Path(upload.filename or '').suffix.lower() not in ('.epro2', '.epru'):
        return jsonify(error='请选择嘉立创V3 .epro2工程。'), 400
    try:
        board = load_bytes(upload.stream.read(MAX_FILE_BYTES+1), upload.filename)
        return jsonify(dimensions=board['dimensions'], components=board['components'])
    except (ValueError, OSError, KeyError, TypeError, IndexError, OverflowError) as exc:
        return jsonify(error='工程检查失败：'+str(exc)), 400


@kicad_bp.route('/step_model/<generation>/<asset>')
def step_model_asset(generation, asset):
    if not re.fullmatch(r'design_[a-f0-9]{32}', generation) or asset not in ('model.json', 'meshes.bin'):
        return '模型不存在。', 404
    relative = session.get('step_model_filename')
    if relative != generation+'/step/model.json':
        return '模型不属于当前工程。', 404
    try:
        model_path = stored_path(relative)
        source = model_path.parent / asset
        if not source.is_file():
            return '模型不存在。', 404
        return send_file(str(source), mimetype='application/json' if asset == 'model.json' else 'application/octet-stream', conditional=True, max_age=0)
    except (OSError, ValueError, KeyError):
        return '模型不存在。', 404


@kicad_bp.route("/process_files", methods=["POST"])
def process_files():
    generate_id()
    if not same_origin_upload():
        return '仅接受同源导入请求。', 403
    service = current_app.extensions.get("motor_service")
    if service is not None and service.status()["busy"]:
        return "电机任务执行期间不能更换PCB，请等待完成。", 409
    layout_file = request.files.get("layout_file")
    schematic_file = request.files.get("schematics_file")
    if layout_file is None or not layout_file.filename:
        return "请选择PCB或嘉立创工程文件。", 400
    suffix = Path(layout_file.filename).suffix.lower()
    if suffix not in (".epro2", ".epru"):
        return "仅支持嘉立创专业版V3 .epro2/.epru工程。", 400
    if schematic_file and not schematic_file.filename.lower().endswith(SCHEMATICS_EXTENSION):
        return "可选原理图目前仅支持.kicad_sch；嘉立创工程可只上传一个文件。", 400
    if schematic_file:
        return "嘉立创V3工程已包含原理图，请只上传一个工程文件。", 400
    step_file = request.files.get('step_file')
    has_step = step_file is not None and bool(step_file.filename)
    if has_step and (Path(step_file.filename).suffix.lower() not in ('.step', '.stp') or request.headers.get('X-Requested-With') != 'XMLHttpRequest'):
        return '请选择STEP/STP整板装配并使用网页联合上传。', 400
    converted_fields = ('step_manifest' in request.files, 'step_mesh' in request.files)
    if (has_step and not all(converted_fields)) or (not has_step and any(converted_fields)):
        return 'STEP转换数据不完整，请从网页重新导入。', 400
    try:
        root = user_folder()
    except ValueError as exc:
        return str(exc), 400
    try:
        root.mkdir(parents=True, exist_ok=True)
    except OSError:
        return "上传目录不可写，请检查应用上传目录配置。", 503
    staging = Path(tempfile.mkdtemp(prefix="pending_", dir=str(root)))
    destination = root / ("design_" + uuid.uuid4().hex)
    active_model = None
    committed = False
    temporary = None
    try:
        name = "board_" + (secure_filename(layout_file.filename) or "import" + suffix)
        path = staging / name
        raw = layout_file.stream.read(MAX_FILE_BYTES + 1)
        if len(raw) > MAX_FILE_BYTES:
            raise PCBImportError("PCB文件超过16 MB。")
        path.write_bytes(raw)
        schematic_path = None
        if schematic_file:
            schematic_path = staging / ("schematic_" + secure_filename(schematic_file.filename))
            raw = schematic_file.stream.read(MAX_FILE_BYTES + 1)
            if len(raw) > MAX_FILE_BYTES:
                raise PCBImportError("原理图文件超过16 MB。")
            schematic_path.write_bytes(raw)
        parsed = parse_design(path, schematic_path)
        if has_step:
            step_dir = staging / 'step'
            step_dir.mkdir()
            _, source_sha = save_upload(step_file, step_dir / 'source.step', MAX_STEP_BYTES)
            _, binary_sha = save_upload(request.files['step_mesh'], step_dir / 'meshes.bin', MAX_MESH_BYTES)
            raw_manifest = request.files['step_manifest'].stream.read(MAX_MANIFEST_BYTES+1)
            if len(raw_manifest) > MAX_MANIFEST_BYTES:
                raise ValueError('STEP模型清单超过2MB。')
            model = json.loads(raw_manifest)
            placements = step_placements(step_dir / 'source.step')
            max_error = match_placements(placements, parsed[0])
            model = validate_mesh(model, step_dir / 'meshes.bin', parsed[0], placements,
                                  Path(step_file.filename.replace('\\', '/')).name[:180], source_sha, binary_sha)
            model['alignment'] = dict(checked_components=len(placements), max_xy_error_mm=max_error,
                                      position_tolerance_mm=.05, angle_tolerance_deg=.1)
            (step_dir / 'model.json').write_text(json.dumps(model, ensure_ascii=False), encoding='utf-8')
            active_model = destination.name + '/step/model.json'
        else:
            candidate = binding_index(root).get(parsed[5]['layout_id'])
            if isinstance(candidate, str):
                try:
                    attach_step_model(parsed, candidate)
                    active_model = candidate
                except (OSError, ValueError, KeyError, TypeError):
                    pass
        with (root / '.import.lock').open('a') as handle:
            try:
                fcntl.flock(handle, fcntl.LOCK_EX | fcntl.LOCK_NB)
            except BlockingIOError:
                raise BlockingIOError('另一个页面正在导入工程，请稍后重试。') from None
            with import_commit_guard(service):
                staging.rename(destination)
                if active_model:
                    attach_step_model(parsed, active_model)
                    (destination / 'step_binding.json').write_text(json.dumps(dict(model=active_model)), encoding='utf-8')
                if has_step:
                    index = binding_index(root)
                    index[parsed[5]['layout_id']] = active_model
                    temporary = root / ('step_bindings_'+uuid.uuid4().hex+'.tmp')
                    temporary.write_text(json.dumps(index), encoding='utf-8')
                    os.replace(str(temporary), str(root / 'step_bindings.json'))
                session['layout_filename'] = destination.name + '/' + name
                session.pop('schematics_filename', None)
                if active_model:
                    session['step_model_filename'] = active_model
                else:
                    session.pop('step_model_filename', None)
                publish_design(parsed, None)
                committed = True
    except BlockingIOError as exc:
        if temporary is not None and temporary.exists():
            temporary.unlink()
        shutil.rmtree(str(staging), ignore_errors=True)
        if not committed:
            shutil.rmtree(str(destination), ignore_errors=True)
        return str(exc), 409
    except (ValueError, OSError, KeyError, TypeError, IndexError, OverflowError, RecursionError) as exc:
        if temporary is not None and temporary.exists():
            temporary.unlink()
        shutil.rmtree(str(staging), ignore_errors=True)
        if not committed:
            shutil.rmtree(str(destination), ignore_errors=True)
        return "导入失败：" + str(exc), 400
    return "文件已处理", 200


def load_files(force=False):
    if "layout_filename" not in session:
        return
    user = session["user_id"]
    with cache_lock:
        if user in layouts_data and not force:
            return
        try:
            layout_path = stored_path(session["layout_filename"])
            schematic_path = stored_path(session["schematics_filename"]) if session.get("schematics_filename") else None
            parsed = parse_design(layout_path, schematic_path)
            model_path = session.get('step_model_filename')
            if model_path:
                try:
                    attach_step_model(parsed, model_path)
                except (OSError, ValueError, KeyError, TypeError):
                    pass
        except (OSError, ValueError, KeyError, TypeError, IndexError):
            for cache in (layouts_data,schematics_data,nets_data,edges_data,pads_data,dimensions_data,import_info_data):
                cache.pop(user, None)
            return
        publish_design(parsed, "interface/static/uploads/" + user + "/" + session["schematics_filename"] if schematic_path else None)



@kicad_bp.route("/select_nets", methods=["POST"])
def select_nets():
    """Emits the possible nets coordinates to the client"""

    first_net = request.form.get("first-net")
    second_net = request.form.get("second-net")

    if (
        "user_id" in session
        and session["user_id"] in pads_data
        and session["user_id"] in nets_data
        and session["user_id"] in dimensions_data
        and first_net in nets_data[session["user_id"]]
        and second_net in nets_data[session["user_id"]]
    ):
        user_id = session["user_id"]
        layout_dimensions = dimensions_data[user_id]
        first_coordinates = []
        second_coordinates = []

        for pad in pads_data[user_id].values():
            if not pad["is_allowed"]:
                continue

            candidate_pad_x, candidate_pad_y, relative_angle = pad_position(pad, layout_dimensions)

            if pad["net"] == first_net or pad["net"] == "/" + first_net:
                first_coordinates.append([pad["id"], candidate_pad_x, candidate_pad_y, relative_angle, pad["net"]])

            if pad["net"] == second_net or pad["net"] == "/" + second_net:
                second_coordinates.append([pad["id"], candidate_pad_x, candidate_pad_y, relative_angle, pad["net"]])

        if len(first_coordinates) > 0 and len(second_coordinates) > 0:
            x1 = [x[1] for x in first_coordinates]
            x2 = [x[1] for x in second_coordinates]
            delta1 = max(x1) - min(x2)
            delta2 = max(x2) - min(x1)
            if delta1 < delta2:
                left_index = x1.index(min(x1))
                right_index = x2.index(max(x2))
                left_coordinates = first_coordinates[left_index]
                right_coordinates = second_coordinates[right_index]
            else:
                left_index = x2.index(min(x2))
                right_index = x1.index(max(x1))
                left_coordinates = second_coordinates[left_index]
                right_coordinates = first_coordinates[right_index]
            candidates_data[user_id] = {
                "left": left_coordinates[0],
                "right": right_coordinates[0],
            }

            emit_owned("probe_candidates", candidates_data[user_id])

        else:
            emit_owned("net_selection_error", f"所选网络未找到可用测点（第一个网络：{len(first_coordinates)}，第二个网络：{len(second_coordinates)}）")

    return "网络已选择"


@sio.on("board_orientation")
def board_orientation(orientation):
    if (not isinstance(orientation, bool) and orientation in (0, 90, 180, 270)
            and session.get("user_id") in dimensions_data):
        dimensions_data[session["user_id"]]["orientation"] = orientation
