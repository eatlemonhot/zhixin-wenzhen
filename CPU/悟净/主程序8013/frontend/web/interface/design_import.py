import csv,io,json,math,re,stat,zipfile,hashlib
from itertools import islice
from pathlib import PurePosixPath,Path
from werkzeug.datastructures import FileStorage
from .pcb_import.model import ImportError
LIMITS={'layout_file':16*1024*1024,'netlist_file':4*1024*1024,'bom_file':4*1024*1024,'reference_pdf':16*1024*1024}
SUFFIX={'.epro2':'layout_file','.epru':'layout_file','.net':'netlist_file','.csv':'bom_file','.xlsx':'bom_file','.pdf':'reference_pdf'}
def text(raw):
    for encoding in (('utf-16',) if raw.startswith((b'\xff\xfe',b'\xfe\xff')) else ('utf-8-sig','gb18030')):
        try:return raw.decode(encoding)
        except UnicodeError:pass
    raise ImportError('文本编码无法识别，请导出UTF-8或UTF-16文件。')
def collect_uploads(files):
    result={key:files.get(key) for key in LIMITS};layout=result['layout_file']
    if layout is None or not layout.filename:return result
    if Path(layout.filename).suffix.lower()!='.zip':return result
    raw=layout.stream.read(32*1024*1024+1)
    if len(raw)>32*1024*1024:raise ImportError('设计包ZIP超过32MB；可分别上传工程、网表和BOM。')
    try:
        with zipfile.ZipFile(io.BytesIO(raw)) as archive:
            items=archive.infolist()
            if len(items)>256 or sum(i.file_size for i in items)>96*1024*1024:raise ImportError('设计包解压大小或文件数量超过限制。')
            names=set();found={}
            for item in items:
                name=item.filename;path=PurePosixPath(name)
                if path.is_absolute() or '..' in path.parts or '\\' in name or stat.S_ISLNK(item.external_attr>>16) or item.flag_bits&1:raise ImportError('设计包包含非法路径、链接或加密文件。')
                if name.casefold() in names:raise ImportError('设计包存在重复文件名。')
                names.add(name.casefold())
                if item.is_dir() or path.name.startswith(('._','~$')) or '__MACOSX' in path.parts:continue
                key=SUFFIX.get(path.suffix.lower())
                if key is None:continue
                if key in found:raise ImportError('设计包中有多份%s，请只保留同一板的一份文件。'%key)
                if item.file_size>LIMITS[key]:raise ImportError('设计包中的%s超过大小限制。'%path.name)
                found[key]=FileStorage(stream=io.BytesIO(archive.read(item)),filename=path.name)
            if 'layout_file' not in found:raise ImportError('ZIP需包含一个V3 .epro2工程；V2 .epro及单独Gerber暂不支持。')
            for key,value in result.items():
                if key!='layout_file' and value is not None and value.filename:
                    if key in found:raise ImportError('ZIP和单独文件重复提供了%s，请二选一。'%key)
                    found[key]=value
            return found
    except zipfile.BadZipFile:raise ImportError('设计包ZIP损坏。') from None
def read_upload(upload,key):
    if upload is None or not upload.filename:return None
    raw=upload.stream.read(LIMITS[key]+1)
    if not raw or len(raw)>LIMITS[key]:raise ImportError('%s为空或超过大小限制。'%upload.filename)
    if key=='reference_pdf' and not raw.startswith(b'%PDF-'):raise ImportError('可选原理图需为真实PDF文件。')
    if key=='netlist_file' and Path(upload.filename).suffix.lower()!='.net':raise ImportError('首版网表请使用Protel2 .net格式。')
    if key=='bom_file' and Path(upload.filename).suffix.lower() not in ('.csv','.xlsx'):raise ImportError('正常BOM支持CSV或XLSX；旧版XLS请先另存为XLSX。')
    return raw
def clean(value):return str(value or '').strip().strip('"').strip()
def netlist_component(block,line_number):

    while block and not block[0]:block=block[1:]
    if not block:raise ImportError('网表器件分组为空。')
    if clean(block[0]).casefold()=='designator':
        fields={};index=0
        while index<len(block):
            key=clean(block[index]);index+=1
            if not key:continue
            if key=='*':
                if any(s.strip() for s in block[index:]):raise ImportError('网表第%d行器件结束标记后仍有属性。'%line_number)
                break
            if index>=len(block):raise ImportError('网表第%d行器件属性缺少值：%s'%(line_number,key))
            value=clean(block[index]);index+=1;key=re.sub(r'\s+','',key).casefold()
            if key in ('designator','footprint','value','parttype') and key in fields:
                old=fields[key];a,b=(old.upper(),value.upper()) if key=='designator' else (old,value)
                if old and value and a!=b:raise ImportError('网表同一器件的%s属性冲突（第%d行）。'%(key,line_number))
            if value or key not in fields:fields[key]=value
        ref=fields.get('designator','').upper()
        component=dict(reference=ref,footprint=fields.get('footprint',''),value=fields.get('value') or fields.get('name') or fields.get('parttype',''))
    else:
        ref=clean(block[0]).upper();component=dict(reference=ref,footprint=clean(block[1]) if len(block)>1 else '',value=clean(block[2]) if len(block)>2 else '')
    if not ref or re.search(r'\s',ref):raise ImportError('网表第%d行元件位号缺失或无效。'%line_number)
    return component

def parse_netlist(raw):
    nets={};components={};pins={};kind=None;block=[]
    for n,line in enumerate(text(raw).splitlines(),1):
        line=line.strip()
        if not line:
            if kind=='[':block.append('')
            continue
        if line.startswith((';','//','#')):continue
        if line in ('[','('):
            if kind is not None:raise ImportError('网表第%d行存在嵌套或未闭合分组。'%n)
            kind=line;block=[];continue
        if line in (']',')'):
            if kind!={']':'[',')':'('}[line]:raise ImportError('网表第%d行分组不匹配。'%n)
            if kind=='[':
                component=netlist_component(block,n);ref=component['reference']
                if ref in components:raise ImportError('网表重复器件分组：'+ref)
                components[ref]=component
            else:
                if len(block)<2:raise ImportError('网表网络分组缺少引脚。')
                net=clean(block[0]);members=nets.setdefault(net,[])
                for item in block[1:]:
                    token=re.match(r'^(?:"([^"]+)"|(\S+))',item)
                    token=(token.group(1) or token.group(2)) if token else ''
                    if '-' not in token:raise ImportError('网表引脚格式无效：'+item[:100])
                    ref,pin=token.rsplit('-',1);ref=ref.upper();pin=clean(pin)
                    if not ref or not pin:raise ImportError('网表引脚编号缺失。')
                    key=(ref,pin)
                    if key in pins and pins[key]!=net:raise ImportError('引脚%s.%s同时连接到两个网络。'%key)
                    if key not in pins:members.append([ref,pin]);pins[key]=net
            kind=None;block=[];continue
        if kind is not None:block.append(line)
        elif not line.upper().startswith(('PROTEL','*','NETLIST')):raise ImportError('无法识别网表头；请导出Protel2 .net格式。')
    if kind is not None or not nets or not pins:raise ImportError('网表为空、未闭合或不包含可解析连接。')
    if len(pins)>100000:raise ImportError('网表引脚数量超过限制。')
    return dict(nets=nets,pins=pins,components=components)
def header(s):return re.sub(r'[\s_()（）\-]+','',str(s).strip().lower())
ALIASES={
 'refs':['designator','reference','ref','references','位号','元件位号','参考标号'],
 'value':['value','comment','值','数值','参数','标称值','规格','元件值','参数值'],
 'part':['manufacturerpart','manufacturerpartnumber','mpn','型号','器件型号','制造商料号','制造商型号'],
 'manufacturer':['manufacturer','制造商','厂家','品牌'],
 'footprint':['footprint','package','封装','封装名称'],
 'tolerance':['tolerance','容差','精度'],
 'lcsc':['lcscpart','lcscpartnumber','lcsc','supplierpart','供应商编号','立创编号','立创料号','物料编码'],
 'dnp':['dnp','donotpopulate','不贴','不装','装配状态']}
def nominal(ref,value):
    prefix=ref[:1];typ={'R':'resistor','C':'capacitor','L':'inductor'}.get(prefix) if re.fullmatch(r'[RCL]\d+[A-Z]?',ref) else None
    if not typ:return None,None
    s=str(value or '').strip().replace('μ','u').replace('µ','u').replace(' ','');s=re.sub(r'(?i)(ohms?|Ω)$','',s)
    explicit=bool(re.search(r'[fFhH]$',s));s=re.sub(r'[fFhH]$','',s)
    scales={'p':1e-12,'n':1e-9,'u':1e-6,'m':1e-3,'k':1e3,'K':1e3,'M':1e6,'R':1.,'r':1.}
    embedded=re.fullmatch(r'(\d+)([RrKkMmunp])(\d+)',s)
    if embedded:number=float(embedded[1]+'.'+embedded[3])*scales[embedded[2]]
    else:
        match=re.fullmatch(r'([+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[eE][+-]?\d+)?)([pnumkKMRr]?)',s)
        if not match:return typ,None
        if prefix in ('C','L') and not explicit and not match[2] and 'e' not in s.lower():return typ,None
        number=float(match[1])*scales.get(match[2],1.)
    if not math.isfinite(number) or number<0 or (prefix!='R' and number==0):return typ,None
    return typ,dict(value=number,unit={'R':'ohm','C':'F','L':'H'}[prefix])
class _ExcelExpression(str):
    pass

def bom_columns(rows):
    columns={};start=None
    for i,row in enumerate(rows[:30]):
        mapping={header(v):j for j,v in enumerate(row)}
        columns={k:next((mapping[header(a)] for a in aliases if header(a) in mapping),None) for k,aliases in ALIASES.items()}
        if columns['refs'] is not None:start=i+1;break
    return columns,start

def xlsx_bom_rows(raw):
    try:
        with zipfile.ZipFile(io.BytesIO(raw)) as archive:
            entries=archive.infolist();names=set()
            if len(entries)>256 or sum(i.file_size for i in entries)>32*1024*1024:raise ImportError('XLSX展开大小或文件数量超过限制。')
            for item in entries:
                path=PurePosixPath(item.filename)
                if item.filename.casefold() in names or path.is_absolute() or '..' in path.parts or '\\' in item.filename or stat.S_ISLNK(item.external_attr>>16) or item.flag_bits&1:raise ImportError('XLSX包含重复条目、非法路径或加密内容。')
                if item.filename.lower().endswith('vbaproject.bin'):raise ImportError('BOM请使用不含宏的XLSX文件。')
                names.add(item.filename.casefold())
            if '[content_types].xml' not in names or 'xl/workbook.xml' not in names:raise ImportError('文件不是有效的XLSX工作簿；请勿只修改扩展名。')
        from openpyxl import load_workbook
        from openpyxl.xml import DEFUSEDXML
        if not DEFUSEDXML:raise ImportError('缺少XLSX XML解析依赖，请重新运行install_local.ps1。')
        workbook=load_workbook(io.BytesIO(raw),read_only=True,data_only=False,keep_links=False)
        try:
            if len(workbook.worksheets)>16:raise ImportError('XLSX工作表超过16张，请单独导出待测板BOM。')
            selected=[];total_cells=0
            for sheet in workbook.worksheets:
                if sheet.sheet_state!='visible':continue
                if (sheet.max_row or 0)>50000 or (sheet.max_column or 0)>256:raise ImportError('XLSX有效区域超过50000行或256列，请移除多余空白格式后导出。')
                rows=[]
                # Reset dimensions so an incorrect A1:A1 cannot hide BOM rows.
                sheet.reset_dimensions()
                for index,cells in enumerate(islice(sheet.iter_rows(),50001),1):
                    total_cells+=len(cells)
                    if index>50000 or len(cells)>256 or total_cells>1000000:raise ImportError('XLSX行列或单元格数量超过限制。')
                    row=[]
                    for cell in cells:
                        value=cell.value
                        if cell.data_type in ('f','e'):value=_ExcelExpression(str(value))
                        elif value is None:value=''
                        elif isinstance(value,float):value=format(value,'.15g')
                        else:value=str(value)
                        row.append(value)
                    rows.append(row)
                columns,start=bom_columns(rows)
                if start is not None and (columns['value'] is not None or columns['part'] is not None):selected.append((sheet.title,rows))
            if not selected:raise ImportError('XLSX未找到含“位号/Designator”和“数值/Value/型号”的BOM表；网络名和引脚连接表不能作为BOM。')
            if len(selected)>1:raise ImportError('XLSX有多张BOM表：'+', '.join(title for title,_ in selected)+'；请只保留当前板的一张BOM表。')
            return selected[0][1]
        finally:workbook.close()
    except ImportError:raise
    except ModuleNotFoundError:raise ImportError('缺少XLSX解析依赖，请重新运行install_local.ps1。') from None
    except Exception as exc:raise ImportError('XLSX工作簿损坏或格式不受支持，请用Excel另存为XLSX后重试。') from exc

def parse_bom(raw,filename=None):
    suffix=Path(filename).suffix.lower() if filename else None
    if suffix=='.xlsx' or (suffix is None and raw.startswith(b'PK')):
        rows=xlsx_bom_rows(raw)
    else:
        if raw.startswith((b'PK',bytes.fromhex('d0cf11e0'))):raise ImportError('BOM文件内容与CSV扩展名不符，请使用真实CSV或XLSX。')
        source=text(raw)
        if not source.strip():raise ImportError('BOM为空。')
        try:dialect=csv.Sniffer().sniff(source[:65536],delimiters=',;\t')
        except csv.Error:dialect=csv.excel_tab if '\t' in source.splitlines()[0] else csv.excel
        try:rows=list(csv.reader(io.StringIO(source),dialect))
        except csv.Error:raise ImportError('BOM CSV结构无效。') from None
    if len(rows)>50000:raise ImportError('BOM行数超过限制。')
    columns,start=bom_columns(rows)
    if start is None:raise ImportError('BOM缺少位号列，请导出Designator/位号。')
    if columns['value'] is None and columns['part'] is None:raise ImportError('BOM缺少Value/值或器件型号列。')
    parts={}
    for row in rows[start:]:
        def cell(key):
            n=columns[key];value=row[n] if n is not None and n<len(row) else ''
            if isinstance(value,_ExcelExpression):raise ImportError('BOM位号/参数列含公式或错误值，请先转换成确定值再导入。')
            return value.strip()
        refs=cell('refs')
        if not refs:continue
        for ref in re.split(r'[,，;；\s]+',refs):
            ref=ref.strip().upper()
            if not ref:continue
            if not re.fullmatch(r'[\w.#-]+',ref):raise ImportError('BOM位号无效：'+ref[:80])
            if ref in parts:raise ImportError('BOM位号重复：'+ref)
            tol=cell('tolerance');relative=None
            if tol:
                v=tol.replace('±','').replace('+/-','').strip()
                try:relative=float(v[:-1])/100 if v.endswith('%') else float(v)
                except ValueError:raise ImportError('BOM容差无法解析：'+ref+' '+tol) from None
                if not math.isfinite(relative) or not 0<=relative<=1:raise ImportError('BOM容差应为百分比，例如1%。')
            value=cell('value') or cell('part');typ,value_si=nominal(ref,value)
            part=cell('part') or (value if typ is None else '')
            parts[ref]=dict(reference=ref,value=value,part_number=part,manufacturer=cell('manufacturer') or None,footprint=cell('footprint'),lcsc=cell('lcsc') or None,tolerance_relative=relative,type=typ or ('dual_opamp' if re.search(r'(?i)NE5532|OPA2197',part) else 'diode' if ref.startswith('D') else 'integrated_circuit' if ref.startswith('U') else 'connector' if ref.startswith(('J','P')) else 'other'),nominal=value_si,dnp=cell('dnp').lower() in ('1','true','yes','dnp','不装','不贴'))
    if not parts:raise ImportError('BOM没有可用元件。')
    return parts
def analyze(board,net_raw,bom_raw,names):
    result=analyze_parts(board,parse_netlist(net_raw),parse_bom(bom_raw,names.get('bom')),names)
    result['source_hashes']=dict(netlist=hashlib.sha256(net_raw).hexdigest(),bom=hashlib.sha256(bom_raw).hexdigest())
    return result

def analyze_parts(board,net,bom,names,native=False):
    pads=board['pads'];pcb={};refs={str(c['reference']).upper() for c in board.get('components',[])}
    for pad in pads.values():
        ref=str(pad.get('reference','')).upper();pin=str(pad.get('pad_number',''))
        if not ref or not pin:continue
        key=(ref,pin);value=str(pad.get('net',''))
        if key in pcb and pcb[key]!=value:raise ImportError('PCB同编号焊盘网络不一致：%s.%s'%key)
        pcb[key]=value
    used={ref for ref,pin in net['pins']};missing=sorted((used|refs)-set(bom))
    if missing:raise ImportError('BOM缺少网表/PCB中的位号：'+', '.join(missing[:20]))
    extra=sorted(set(bom)-used);warnings=[]
    if extra:warnings.append('BOM有%d个未参与网表网络的器件，保留记录供核对。'%len(extra))
    absent=sorted(key for key,q in pcb.items() if q and key not in net['pins'])
    if absent:raise ImportError('正常网表遗漏PCB已连接引脚：'+', '.join('%s.%s'%key for key in absent[:20]))
    aliases={};reverse={};checked=0
    for key,n in net['pins'].items():
        if key not in pcb:raise ImportError('网表引脚在PCB中找不到：%s.%s'%key)
        q=pcb[key]
        if not q:raise ImportError('PCB焊盘未分配网络：%s.%s'%key)
        if q in aliases and aliases[q]!=n:raise ImportError('网表与PCB连接冲突：PCB网络%s跨接了网表的不同网络。'%q)
        if n in reverse and reverse[n]!=q:raise ImportError('网表与PCB连接冲突：网表网络%s在PCB中被分成不同网络。'%n)
        aliases[q]=n;reverse[n]=q;checked+=1
    components=[];missing_values=[];missing_tolerance=[];blocking=[]
    for ref,p in bom.items():
        pins={pin:n for (r,pin),n in net['pins'].items() if r==ref};kind=p['type'];item=dict(ref=ref,type=kind,pins=pins,package=p['footprint'],assembly='dnp' if p['dnp'] else 'fitted')
        if kind in ('resistor','capacitor','inductor'):
            item['nominal']=dict(p['nominal'] or dict(value=None,unit={'resistor':'ohm','capacitor':'F','inductor':'H'}[kind]),tolerance_relative=p['tolerance_relative'])
            if p['nominal'] is None:missing_values.append(ref)
            if p['tolerance_relative'] is None:missing_tolerance.append(ref)
        else:item.update(part_number=p['part_number'] or p['value'] or None,manufacturer=p['manufacturer'])
        item['source_value']=p['value'];item['lcsc']=p['lcsc'];components.append(item)
    for c in board.get('components',[])+board.get('schematic',{}).get('components',[])+list(net['components'].values()):
        ref=str(c.get('reference','')).upper()
        if ref in bom:
            typ,old=nominal(ref,c.get('value',''));new=bom[ref]['nominal']
            if old is not None and new is not None and abs(old['value']-new['value'])>max(1e-18,abs(old['value'])*1e-9):
                if native:blocking.append('原理图与PCB标称值不一致：'+ref)
                else:raise ImportError('工程/网表与BOM标称值不一致：'+ref)
    if missing_tolerance:warnings.append('BOM未给出%d个R/C/L的容差；没有擅自填成±1%%。'%len(missing_tolerance))
    if missing_values:warnings.append('标称值缺单位或无法解析：'+', '.join(missing_values[:20]))
    unidentified=[p['reference'] for p in bom.values() if not p['nominal'] and not p['part_number'] and not p['value']]
    if unidentified:warnings.append('器件型号或参数未提供：'+', '.join(unidentified[:20])+'；导入通过不代表物理模型已支持。')
    return dict(schema='design-import/1.0',components=components,nets=sorted(net['nets']),net_aliases=aliases,bom=list(bom.values()),source_files=names,source_hashes={},report=dict(connectivity_consistent=not blocking,diagnostic_ready=not blocking and not missing_values,blocking_issues=sorted(set(blocking)),independent_netlist_checked=not native,connectivity_source='native_pcb_pad_net' if native else 'external_protel_netlist',checked_pins=checked,component_count=len(components),net_count=len(net['nets']),missing_nominal_values=missing_values,missing_tolerances=missing_tolerance,warnings=warnings,hardware_execution_available=False))
def attach(parsed,data):
    parsed[0]['diagnostic_import']=data;parsed[6]['diagnostic_summary']=data['report']
def build_job(board,dimensions,payload):
    data=board.get('diagnostic_import')
    if not data:raise ImportError('请先导入嘉立创V3 epro2工程。')
    if data['report'].get('diagnostic_ready') is False:raise ImportError('工程参数尚不能用于诊断：'+'；'.join(data['report'].get('blocking_issues',[])+data['report'].get('missing_nominal_values',[])))
    nets=set(data['nets']);ground=payload.get('ground_net');drive=payload.get('excitation_net')
    if ground not in nets or drive not in nets or drive==ground:raise ImportError('请选择有效且不同的GND和激励网络。')
    mode=payload.get('power_mode');rails=payload.get('rails',{})
    if mode not in ('powered','unpowered') or not isinstance(rails,dict):raise ImportError('请确认带电/断电测试及供电条件。')
    if mode=='powered' and not rails:raise ImportError('带电测试请填写电源网络和电压。')
    if mode=='unpowered' and rails:raise ImportError('断电测试不应同时填写已上电电源轨。')
    if any(n not in nets or n==ground or not isinstance(v,(int,float)) or isinstance(v,bool) or not math.isfinite(v) or abs(v)>1000 for n,v in rails.items()):raise ImportError('电源网络或标称电压无效。')
    if drive in rails:raise ImportError('不能把电源轨直接选作外部激励端。')
    if data['report']['missing_nominal_values']:raise ImportError('请先补齐工程中的元件标称值：'+', '.join(data['report']['missing_nominal_values']))
    peak=payload.get('max_input_peak_V',.1)
    if not isinstance(peak,(int,float)) or isinstance(peak,bool) or not math.isfinite(peak) or not 0<peak<=10:raise ImportError('激励峰值上限需为0～10V内的正数；实测还受设备线性量程约束。')
    points=[];ground_points=[];drive_points=[]
    for uid,p in board['pads'].items():
        if not p['is_allowed']:continue
        net=data['net_aliases'].get(p['net'])
        if net is None:continue
        point=dict(point_id=uid,net=net,pad_ref=p['reference']+'.'+p['pad_number'],position_mm=dict(x=p['footprint_x'],y=p['footprint_y']),side=p.get('side','top'),accessibility_verified=False)
        if net==ground:ground_points.append(point)
        elif net==drive:drive_points.append(point)
        else:points.append(point)
    if not ground_points or not drive_points:raise ImportError('所选GND或激励网络没有可选顶面/通孔测点，请重新选择。')
    return dict(schema='pcbdiag-netlist-job/1.0-draft',job_id='job_'+dimensions['layout_id'][:16],execution=dict(mode='plan_only'),circuit=dict(ground_net=ground,nets=sorted(nets),components=data['components']),power=dict(mode=mode,source='external_manual',rails=[dict(net=n,nominal_V=v) for n,v in rails.items()],require_power_state_confirmation=True),operating_conditions=dict(external_loads=[],switch_states={},verification_state='pending'),access=dict(ground_contact=ground_points[0],ground_candidates=ground_points,excitation_ports=[dict(port_id='input',positive_net=drive,negative_net=ground,candidates=drive_points)],measurement_points=points,positioning=dict(mode='manual_confirm',coordinate_system_id='pcb_mm',board_alignment_asset=None,PCB_preview_rotation_degrees=dimensions['orientation'])),station=dict(hardware_profile='active_verified_profile',calibration_profile='active_verified_profile'),test_constraints=dict(allowed_waveforms=['sine'],max_dut_input_peak_V=peak,frequency_Hz_range=None,allowed_Rs_ohm=None,prohibited_drive_nets=list(rails)),diagnosis=dict(model_selection='auto_by_netlist_and_domain',max_simultaneous_faults=1,requested_fault_modes=['normal','parameter_drift','open','short'],normal_reference=dict(source='derive_from_nominal_netlist',known_good_measurements_asset=None),require_independent_confirmation=True,stop_policy='unique_if_independently_verified_else_compatible_set'),budget=dict(max_measurement_conditions=80,max_elapsed_ms=60000),output=dict(save_measurement_history=True,save_planning_trace=True),import_provenance=dict(layout_id=dimensions['layout_id'],sources=data['source_files'],hashes=data['source_hashes'],warnings=data['report']['warnings']),readiness=dict(hardware_execution_available=False,requirements=['采集/CPU自动执行器接入','实际前端与器件模型标定','实板测点与机械对准确认','无健康参考路径独立验收']))

