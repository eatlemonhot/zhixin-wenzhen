import copy,json
from flask import Blueprint,jsonify,request,current_app,session,send_file,Response
from . import kicad
from .pcb_web import layout
from .design_import import build_job
design_bp=Blueprint('design_package',__name__,url_prefix='/design-package')
@design_bp.get('/status')
def status():
    user,dims,pads=layout(required=False)
    if not dims:return jsonify(loaded=False,complete=False)
    with kicad.cache_lock:data=copy.deepcopy(kicad.layouts_data[user].get('diagnostic_import'))
    return jsonify(loaded=True,complete=data is not None,layout_id=dims['layout_id'],data=data,pdf_url='/design-package/reference.pdf' if data and data.get('reference_pdf_name') else None)
@design_bp.get('/reference.pdf')
def pdf():
    user,dims,_=layout(required=False)
    if not dims:return jsonify(error='当前会话没有原理图PDF。'),404
    with kicad.cache_lock:data=kicad.layouts_data[user].get('diagnostic_import')
    if not data or not data.get('reference_pdf_name'):return jsonify(error='当前会话没有原理图PDF。'),404
    path=kicad.stored_path(session['layout_filename']).parent/'diagnostic_reference.pdf'
    return send_file(path,mimetype='application/pdf',as_attachment=False,download_name='schematic.pdf')
@design_bp.post('/job')
def job():
    if not kicad.same_origin_upload() or request.headers.get('X-Requested-With')!='XMLHttpRequest' or not request.is_json:return jsonify(error='请从当前网页生成诊断任务。'),403
    if request.content_length and request.content_length>32768:return jsonify(error='任务设置过大。'),413
    payload=request.get_json()
    if not isinstance(payload,dict):return jsonify(error='任务设置格式无效。'),400
    user,dims,_=layout(required=False)
    if not dims:return jsonify(error='请先导入设计包。'),409
    if payload.get('layout_id')!=dims['layout_id']:return jsonify(error='工程已变化，请刷新后重新生成任务。'),409
    with kicad.cache_lock:board=copy.deepcopy(kicad.layouts_data[user])
    try:result=build_job(board,dims,payload)
    except (ValueError,TypeError,KeyError) as exc:return jsonify(error=str(exc)),422
    response=Response(json.dumps(result,ensure_ascii=False,indent=2,allow_nan=False)+'\n',mimetype='application/json');response.headers['Content-Disposition']='attachment; filename="job.json"';return response
