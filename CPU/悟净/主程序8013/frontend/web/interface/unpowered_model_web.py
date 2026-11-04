from pathlib import Path
import sys,uuid
from flask import Blueprint,request,jsonify,session,Response,current_app
from . import kicad
APP=Path(__file__).resolve().parents[3]
sys.path.insert(0,str(APP))
from probe_system.unpowered_ai.service import run_saved
from probe_system.unpowered_ai.core import TEMPLATES
bp=Blueprint('unpowered_model',__name__,url_prefix='/diagnosis/unpowered/model')
@bp.before_request
def authorize():
 if not session.get('user_id'):return jsonify(error='请先打开主页。'),403
 if request.method=='POST':
  if not kicad.same_origin_upload() or request.headers.get('X-Requested-With')!='XMLHttpRequest' or not request.is_json:return jsonify(error='只接受本站JSON请求。'),403
  if request.content_length and request.content_length>131072:return jsonify(error='模型请求过大。'),413
@bp.errorhandler(ValueError)
def invalid(exc):return jsonify(error=str(exc)),422
def payload():
 value=request.get_json()
 if not isinstance(value,dict):raise ValueError('请求必须是JSON对象')
 return value
@bp.get('/info')
def info():
 return jsonify(schema='unpowered-rc-integrated/2.0',templates=list(TEMPLATES),power_mode='unpowered',rails='disconnected',fixed_ground=True,Rs_ohm=[100,10000],software_available=True,hardware_fault_diagnosis_available=hasattr(current_app.extensions.get('unpowered_measurements'),'prepare_job'),NPU_executed=False,active_AB_available=False,limitations=['器件域：8类4～5元件无源R/C模板与正常参考','输入合同：校准F6特征','计算路径：CPU模型前向与物理核验','数据入口：已保存的校准特征'])
@bp.post('/evaluate')
def evaluate():
 value=payload()
 if set(value)-{'job','reference','observations','confirmations'}:raise ValueError('未知模型请求字段')
 if not isinstance(value.get('job'),dict) or not isinstance(value.get('observations',{}),dict) or not isinstance(value.get('confirmations',{}),dict):raise ValueError('任务/观测格式错误')
 return jsonify(run_saved(value['job'],value.get('reference'),value.get('observations',{}),value.get('confirmations',{})))
@bp.get('/lab')
def lab():
 return Response((Path(__file__).with_name('unpowered_model_lab.html')).read_text(encoding='utf8'),mimetype='text/html',headers={'Cache-Control':'no-store'})
def register(app):app.register_blueprint(bp)
