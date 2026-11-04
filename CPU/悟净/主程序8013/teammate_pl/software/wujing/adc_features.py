
import math


def decode_words(payload, byteorder, encoding):
    if byteorder not in ("little", "big") or encoding not in ("straight_binary", "twos_complement"):
        raise ValueError("必须明确指定字节序与 ADC 原码编码")
    if not payload or len(payload) % 2:
        raise ValueError("原码记录为空或包含半个 16 位字")
    codes, raw_codes, overrange = [], [], []
    for offset in range(0, len(payload), 2):
        word = int.from_bytes(payload[offset:offset + 2], byteorder)
        if word & 0x7000:
            raise ValueError("原码保留位非零，不符合16位原码格式")
        raw = word & 0xFFF
        raw_codes.append(raw)
        codes.append(raw - 4096 if encoding == "twos_complement" and raw & 0x800 else raw)
        overrange.append(bool(word & 0x8000))
    return codes, raw_codes, overrange


def code_statistics(codes, raw_codes, overrange):
    count = len(codes)
    total = sum(codes)
    square_total = sum(value * value for value in codes)
    variance_numerator = count * square_total - total * total
    return {
        "sample_count": count, "sum_codes": total, "sum_squared_codes": square_total,
        "minimum_code": min(codes), "maximum_code": max(codes),
        "mean_code": total / count, "peak_to_peak_codes": max(codes) - min(codes),
        "rms_codes": math.sqrt(square_total / count),
        "ac_rms_codes": math.sqrt(variance_numerator) / count,
        "variance_codes_squared": variance_numerator / (count * count),
        "overrange_count": sum(overrange),
        "raw_zero_count": raw_codes.count(0), "raw_all_ones_count": raw_codes.count(4095),
        "unit": "ADC code", "voltage_calibrated": False,
    }


def step_features(codes, overrange, sample_rate_hz, step):
    start, end = step["start_index"], step["end_index"]
    initial, final = step["initial_code"], step["final_code"]
    if (type(start) is not int or type(end) is not int or not 0 <= start < end <= len(codes)
            or type(initial) not in (int, float) or type(final) not in (int, float)
            or not math.isfinite(initial) or not math.isfinite(final)):
        raise ValueError("阶跃区间或已知初末码无效")
    result = {"start_index": start, "end_index": end, "initial_code": initial, "final_code": final,
              "tau_63_seconds": None, "tau_log_fit_seconds": None, "fit_point_count": 0,
              "fit_r_squared": None, "reason": None,
              "model_assumption": "已知初末码的一阶单阶跃；不是物理故障分类"}
    if any(overrange[start:end]):
        result["reason"] = "阶跃窗口包含 OTR，拒绝时间常数估计"
        return result
    delta = final - initial
    if delta == 0:
        result["reason"] = "已知初末码相同，没有可归一化的阶跃"
        return result
    progress = [(value - initial) / delta for value in codes[start:end]]
    threshold = 1 - math.exp(-1)
    for index in range(1, len(progress)):
        left, right = progress[index - 1:index + 1]
        if left < threshold <= right and right > left:
            result["tau_63_seconds"] = (index - 1 + (threshold - left) / (right - left)) / sample_rate_hz
            break
    points = [(index / sample_rate_hz, math.log(1 - value))
              for index, value in enumerate(progress) if 0.05 <= 1 - value <= 0.95]
    result["fit_point_count"] = len(points)
    if len(points) >= 8:
        mean_x = math.fsum(x for x, _ in points) / len(points)
        mean_y = math.fsum(y for _, y in points) / len(points)
        xx = math.fsum((x - mean_x) ** 2 for x, _ in points)
        yy = math.fsum((y - mean_y) ** 2 for _, y in points)
        xy = math.fsum((x - mean_x) * (y - mean_y) for x, y in points)
        slope = xy / xx if xx else 0
        if slope < 0 and yy > 0:
            result["tau_log_fit_seconds"] = -1 / slope
            result["fit_r_squared"] = min(1.0, max(0.0, xy * xy / (xx * yy)))
    if result["tau_63_seconds"] is None or result["tau_log_fit_seconds"] is None:
        result["reason"] = "窗口或有效变化不足，至少一种时间常数估计不可用"
    return result
