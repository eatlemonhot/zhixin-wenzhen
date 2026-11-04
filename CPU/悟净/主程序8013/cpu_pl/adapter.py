import copy
import math
import struct
from .common import ReceiveError, need, finite, text_id, digest, MAX_CONDITIONS
from .vendor.model_export import export_condition, ExportError, CONTRACT, ORDER

SCHEMA = 'zhixin.pl-features/v1'
RS = (100, 10000)


def near(actual, expected, code):
    need(finite(actual) and finite(expected) and abs(actual-expected) <= 1e-9 + 1e-7*abs(expected), code)


def normalize(document):
    need(isinstance(document, dict), 'JSON_OBJECT_REQUIRED')
    schema = document.get('schema')
    if schema == SCHEMA:
        results = [document]
    elif schema == 'zhixin.pl-condition/v1':
        try:
            results = [export_condition(document)]
        except (ExportError, KeyError, TypeError, ValueError, OverflowError) as exc:
            raise ReceiveError('PL_CONDITION_INVALID', str(exc))
    elif schema in ('zhixin.pl-session/v1', 'zhixin.pl-feature-session/v1'):
        items = document.get('conditions')
        need(isinstance(items, list) and 0 < len(items) <= MAX_CONDITIONS, 'SESSION_SHAPE')
        expected = 'zhixin.pl-condition/v1' if schema == 'zhixin.pl-session/v1' else SCHEMA
        need(all(isinstance(i, dict) and i.get('schema') == expected for i in items), 'SESSION_ITEM_SCHEMA')
        results = []
        for item in items:
            results.extend(normalize(item))
    elif schema == 'zhixin.model-input/v1':
        raise ReceiveError('FULL_RESULT_REQUIRED', 'Bare matrix lacks frame, drift and qualification evidence; supply features.json.')
    else:
        raise ReceiveError('UNSUPPORTED_PL_SCHEMA', str(schema))
    return copy.deepcopy(results)


def validate_result(result):
    need(result.get('schema') == SCHEMA and result.get('feature_contract') == CONTRACT, 'FEATURE_CONTRACT_MISMATCH')
    need(result.get('order') == ORDER, 'FEATURE_ORDER_MISMATCH')
    expected_hash = result.get('content_sha256')
    body = dict(result)
    body.pop('content_sha256', None)
    need(isinstance(expected_hash, str) and digest(body) == expected_hash, 'RESULT_CONTENT_HASH_MISMATCH')
    values = result.get('value')
    need(isinstance(values, list) and len(values) == 6 and all(finite(v) for v in values), 'FEATURE_SHAPE_OR_NUMBER')
    available = result.get('available')
    need(isinstance(available, list) and len(available) == 6 and all(v is True for v in available), 'FEATURE_UNAVAILABLE')
    need(values[3] >= 0, 'NEGATIVE_RESIDUAL')
    condition = result.get('condition')
    need(isinstance(condition, dict), 'CONDITION_REQUIRED')
    for key in ('condition_id', 'point_id', 'frontend_profile_id', 'acquisition_session_id'):
        need(text_id(condition.get(key)), 'CONDITION_ID_REQUIRED', key)
    need(type(condition.get('rs_nominal_ohm')) in (int, float) and condition['rs_nominal_ohm'] in RS, 'UNSUPPORTED_RS')
    need(condition.get('origin') in ('hardware', 'simulation', 'synthetic_test_vector'), 'ORIGIN_REQUIRED')
    need(condition.get('scope') in ('real_dut', 'direct_loopback', 'virtual_network', 'synthetic'), 'SCOPE_REQUIRED')
    measured = condition.get('rs_measured_ohm')
    need(measured is None or finite(measured) and measured > 0, 'INVALID_CALIBRATED_RS')
    frames = result.get('frames')
    need(type(frames) is int and 0 < frames <= 4096, 'FRAME_COUNT')
    ratio = result.get('interval_ticks')
    need(type(ratio) is int and 1 <= ratio <= 65536 and ratio & (ratio-1) == 0, 'DECIMATION_FACTOR')
    ftw = result.get('dds_ftw')
    need(type(ftw) is int and 0 < ftw*ratio < 0x80000000, 'DDS_FTW_OR_ALIASING')
    near(result.get('actual_frequency_hz'), ftw*25_000_000./2**32, 'FREQUENCY_METADATA_MISMATCH')
    near(result.get('sample_rate_hz'), 25_000_000./ratio, 'RATE_METADATA_MISMATCH')
    filt = result.get('filter')
    need(isinstance(filt, dict), 'FILTER_METADATA_REQUIRED')
    need(filt.get('id') == int(ratio != 1) and filt.get('decimation_factor') == ratio and
         filt.get('cic_order') == (3 if ratio != 1 else 0) and
         filt.get('dc_normalized') is True and filt.get('fundamental_compensated') is True and
         filt.get('residual_compensated') is False, 'FILTER_CONTRACT_MISMATCH')
    unit = result.get('channel_unit')
    need(unit in ('V', 'ADC_counts'), 'CHANNEL_UNIT')
    if unit == 'V':
        need(text_id(result.get('calibration_id')), 'CALIBRATION_ID_REQUIRED')
        evidence = result.get('calibration_evidence_sha256')
        need(isinstance(evidence, str) and len(evidence) == 64 and all(c in '0123456789abcdef' for c in evidence), 'CALIBRATION_HASH_REQUIRED')
    stats = result.get('channel_statistics')
    need(isinstance(stats, dict) and {'A', 'B', 'C'} <= set(stats) <= {'A', 'B', 'C', 'A_check'}, 'CHANNEL_STATISTICS_REQUIRED')
    identities, seen = [], set()
    for channel, stat in stats.items():
        need(isinstance(stat, dict) and stat.get('frames') == frames, 'CHANNEL_FRAME_COUNT')
        pair = stat.get('phasor_peak')
        need(isinstance(pair, list) and len(pair) == 2 and all(finite(v) for v in pair), 'PHASOR_SHAPE')
        for key in ('dc', 'ls_residual_rms', 'phasor_scatter_rms'):
            need(finite(stat.get(key)), 'INVALID_CHANNEL_STATISTIC', key)
        need(stat['ls_residual_rms'] >= 0 and stat['phasor_scatter_rms'] >= 0, 'NEGATIVE_CHANNEL_STATISTIC')
        ids, ticks = stat.get('frame_ids'), stat.get('first_ticks')
        need(isinstance(ids, list) and isinstance(ticks, list) and len(ids) == len(ticks) == frames, 'FRAME_EVIDENCE_COUNT')
        previous = -1
        for frame_id, tick in zip(ids, ticks):
            need(type(frame_id) is int and 0 < frame_id < 2**32 and frame_id not in seen, 'DUPLICATE_OR_INVALID_FRAME_ID')
            need(isinstance(tick, str) and tick.isascii() and tick.isdigit() and len(tick) <= 20 and previous < int(tick) < 2**64, 'INVALID_SAMPLE_TICK')
            seen.add(frame_id)
            previous = int(tick)
            identities.append(dict(session=condition['acquisition_session_id'], channel=channel, frame_id=frame_id, tick=tick))
    a = complex(*stats['A']['phasor_peak'])
    need(abs(a) > 0, 'ZERO_REFERENCE')
    c, b = complex(*stats['C']['phasor_peak'])/a, complex(*stats['B']['phasor_peak'])/a
    recomputed = [c.real, c.imag, stats['C']['dc']/abs(a), stats['C']['ls_residual_rms']/abs(a), b.real, b.imag]
    for actual, expected in zip(values, recomputed):
        near(actual, expected, 'FEATURE_STATISTICS_MISMATCH')
    drift = result.get('source_drift')
    if 'A_check' in stats:
        change = complex(*stats['A_check']['phasor_peak'])/a
        need(isinstance(drift, dict), 'SOURCE_DRIFT_REQUIRED')
        near(drift.get('relative_amplitude'), abs(abs(change)-1), 'SOURCE_DRIFT_MISMATCH')
        near(drift.get('phase_radians'), math.atan2(change.imag, change.real), 'SOURCE_DRIFT_MISMATCH')
    else:
        need(drift is None, 'SOURCE_DRIFT_WITHOUT_REFERENCE')
    need(isinstance(result.get('qualification'), dict), 'QUALIFICATION_REQUIRED')
    integration = result.get('integration')
    need(isinstance(integration, dict) and integration.get('format_ready') is True, 'SENDER_FORMAT_NOT_READY')
    requested = condition.get('requested_frequency_hz')
    if requested is not None:
        tolerance = condition.get('frequency_tolerance_ppm', 10.)
        need(finite(requested) and requested > 0 and finite(tolerance) and tolerance >= 0, 'INVALID_FREQUENCY_REQUEST')
        need(abs(result['actual_frequency_hz']-requested) <= requested*tolerance*1e-6, 'FREQUENCY_OUTSIDE_REQUEST')
    try:
        binary = struct.pack('<6f', *values)
    except (OverflowError, struct.error) as exc:
        raise ReceiveError('FLOAT32_OVERFLOW', str(exc))
    narrowed = list(struct.unpack('<6f', binary))
    need(all(math.isfinite(v) for v in narrowed), 'FLOAT32_OVERFLOW')
    return identities, narrowed, binary


def request_index(document):
    if document is None:
        return None
    need(isinstance(document, dict), 'CPU_REQUEST_INDEX_SCHEMA')
    need(document.get('schema') == 'cpu-pl-request-index/1.0', 'CPU_REQUEST_INDEX_SCHEMA')
    need(text_id(document.get('job_id')) and text_id(document.get('run_id')), 'CPU_JOB_RUN_ID')
    items = document.get('conditions')
    need(isinstance(items, list) and 0 < len(items) <= MAX_CONDITIONS, 'CPU_REQUESTS_REQUIRED')
    index = {}
    for item in items:
        need(isinstance(item, dict) and text_id(item.get('condition_id')), 'CPU_CONDITION_ID')
        need(item['condition_id'] not in index, 'CPU_DUPLICATE_CONDITION')
        need(item.get('role') in ('fit', 'confirmation', 'normal_reference'), 'CPU_MEASUREMENT_ROLE')
        need(text_id(item.get('test_id')) and text_id(item.get('attempt_id')), 'CPU_TEST_ATTEMPT_ID')
        for key in ('acquisition_session_id','point_id','frontend_profile_id','origin','scope'):
            need(text_id(item.get(key)), 'CPU_REQUEST_FIELD', key)
        need(item.get('rs_nominal_ohm') in RS and type(item.get('rs_nominal_ohm')) in (int,float), 'CPU_REQUEST_RS')
        need(type(item.get('frames_per_channel')) is int and item['frames_per_channel'] in (16,256), 'CPU_REQUEST_FRAMES')
        need(finite(item.get('requested_frequency_hz')) and item['requested_frequency_hz'] > 0, 'CPU_REQUEST_FREQUENCY')
        need(finite(item.get('frequency_tolerance_ppm')) and item['frequency_tolerance_ppm'] >= 0, 'CPU_FREQUENCY_TOLERANCE')
        for role in ('excitation','measurement'):
            need(isinstance(item.get(role), dict) and all(text_id(item[role].get(k)) for k in ('point_id','net')), 'CPU_POINT_MAPPING', role)
        need(item['measurement']['point_id'] == item['point_id'] and text_id(item.get('ground_net')), 'CPU_MEASUREMENT_MAPPING')
        need(item['excitation']['net'] != item['ground_net'], 'CPU_DRIVE_GROUND_CONFLICT')
        index[item['condition_id']] = item
    return document, index


def bind(result, index):
    if index is None:
        return dict(status='unbound', role=None, excitation_verification='not_available', issues=['CPU_REQUEST_BINDING_MISSING'])
    parent, mapping = index
    condition = result['condition']
    request = mapping.get(condition['condition_id'])
    need(request is not None, 'UNREQUESTED_CONDITION')
    for key in ('acquisition_session_id','point_id','frontend_profile_id','origin','scope','rs_nominal_ohm'):
        need(condition.get(key) == request[key], 'CPU_REQUEST_MISMATCH', key)
    need(result['frames'] == request['frames_per_channel'], 'CPU_FRAME_COUNT_MISMATCH')
    f, tolerance = request['requested_frequency_hz'], request['frequency_tolerance_ppm']
    need(abs(result['actual_frequency_hz']-f) <= f*tolerance*1e-6, 'CPU_FREQUENCY_MISMATCH')
    # 路由元数据为可选字段；存在时与CPU请求核对，回读来源单独记录。
    for name, expected in (('excitation_point_id',request['excitation']['point_id']),
                           ('excitation_net',request['excitation']['net']),
                           ('measurement_net',request['measurement']['net']),('ground_net',request['ground_net'])):
        need(name not in condition or condition[name] == expected, 'CPU_ROUTING_ECHO_MISMATCH', name)
    return dict(status='matched_to_cpu_request', job_id=parent['job_id'], run_id=parent['run_id'],
                role=request['role'], test_id=request['test_id'], attempt_id=request['attempt_id'],
                request_sha256=digest(request), request=copy.deepcopy(request),
                excitation_verification='CPU_request_association_only_not_independent_PL_readback',
                issues=['EXCITATION_PHYSICAL_READBACK_NOT_PROVEN'])


def align(documents, requests=None):
    need(isinstance(documents, list) and 0 < len(documents) <= MAX_CONDITIONS, 'DOCUMENT_COUNT')
    index = request_index(requests)
    results, observations, claims, binary, seen = [], [], [], bytearray(), set()
    for document in documents:
        for result in normalize(document):
            need(len(results) < MAX_CONDITIONS, 'TOO_MANY_CONDITIONS')
            frames, narrowed, payload = validate_result(result)
            identity = (result['condition']['acquisition_session_id'], result['condition']['condition_id'])
            need(identity not in seen, 'DUPLICATE_CONDITION')
            seen.add(identity)
            binding = bind(result, index)
            results.append(result)
            binary.extend(payload)
            row = dict(condition=copy.deepcopy(result['condition']), actual_frequency_hz=result['actual_frequency_hz'],
                       value=copy.deepcopy(result['value']), value_float32=narrowed, available=list(result['available']),
                       frames=result['frames'], sample_rate_hz=result['sample_rate_hz'], interval_ticks=result['interval_ticks'],
                       filter=copy.deepcopy(result['filter']), channel_unit=result['channel_unit'],
                       calibration_id=result['calibration_id'], calibration_evidence_sha256=result['calibration_evidence_sha256'],
                       channel_statistics=copy.deepcopy(result['channel_statistics']), source_drift=copy.deepcopy(result['source_drift']),
                       qualification=copy.deepcopy(result['qualification']), sender_content_sha256=result['content_sha256'],
                       full_result_index=len(results)-1, cpu_binding=binding,
                       inference=dict(ready=False, reasons=['MODEL_FOR_PL_LSQ_CONTRACT_AND_RS100_10000_NOT_CONNECTED'],
                                      hardware_qualification_not_inferred=True, npu_executed=False))
            observations.append(row)
            claims.append(dict(condition=identity, result_digest=digest(result), frames=frames, binding=binding))
    domains = sorted({(r['condition']['origin'],r['condition']['frontend_profile_id'],r['calibration_id'] or '',r['channel_unit']) for r in results})
    matrix = dict(schema='cpu-pl-aligned-matrix/1.0', feature_contract=CONTRACT, order=ORDER, dtype='float32', byte_order='little',
                  shape=[len(observations),6], rows=observations, domain_groups=[list(d) for d in domains],
                  full_results_asset='full_results.json', ready_for_current_legacy_model=False,
                  requires_version_matched_model_encoder=True, npu_executed=False)
    return results, matrix, bytes(binary), claims
