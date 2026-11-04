(function (root) {
    'use strict';

    function channel(input, name) {
        if (!input || !Array.isArray(input.samples) || input.samples.length < 4 || input.samples.length > 65536) {
            throw new Error(name + '尚无完整采样数据');
        }
        if (!input.samples.every(value => Number.isFinite(value) && value >= -2048 && value <= 2047)) {
            throw new Error(name + '采样码值无效');
        }
        const m = input.metadata || {};
        const integer = value => Number.isSafeInteger(value) && value >= 0;
        if (m.metadata_version !== 2 || !integer(m.first_phase_word) || m.first_phase_word > 0xffffffff ||
            !integer(m.dds_ftw) || m.dds_ftw === 0 || m.dds_ftw >= 0x80000000 ||
            !integer(m.dac_tag) || m.dac_tag === 0 || !integer(m.raw_clock_hz) || !m.raw_clock_hz ||
            !integer(m.interval_ticks) || !m.interval_ticks || m.interval_ticks > 65536 ||
            (m.interval_ticks & (m.interval_ticks - 1)) !== 0) {
            throw new Error(name + '缺少有效的同源相位元数据');
        }
        if (input.valid !== true) throw new Error(name + '采集质量尚未通过');
        return { samples: input.samples.slice(), metadata: { ...m }, step: m.interval_ticks / m.raw_clock_hz };
    }

    function preparePair(input) {
        if (!input || input.schema !== 'probe-waveform-pair/1' || input.source !== 'adc') {
            throw new Error('等待同组双探针采样数据');
        }
        if (typeof input.reference_id !== 'string' || !input.reference_id.trim()) {
            throw new Error('两路波形缺少共同相位参考');
        }
        let a,b,frequency;
            a=channel(input.channels&&input.channels.A,'探针A');b=channel(input.channels&&input.channels.B,'探针B');
            const ma=a.metadata,mb=b.metadata;
            if(ma.dds_ftw!==mb.dds_ftw||ma.dac_tag!==mb.dac_tag||ma.raw_clock_hz!==mb.raw_clock_hz)throw new Error('两路波形的激励身份不一致，不能比较相位');
            frequency=ma.dds_ftw*ma.raw_clock_hz/2**32;
            a.origin=0;b.origin=((mb.first_phase_word-ma.first_phase_word)>>>0)/2**32/frequency;
        const start = Math.max(a.origin, b.origin);
        const finish = Math.min(a.origin + (a.samples.length - 1) * a.step, b.origin + (b.samples.length - 1) * b.step);
        if (finish - start < 1 / frequency) throw new Error('共同采样窗口不足一个周期');
        const end = Math.min(finish, start + 4 / frequency);
        let low = Infinity, high = -Infinity;
        for (const c of [a, b]) {
            const first = Math.max(0, Math.floor((start - c.origin) / c.step));
            const last = Math.min(c.samples.length - 1, Math.ceil((end - c.origin) / c.step));
            for (let i = first; i <= last; i++) {
                low = Math.min(low, c.samples[i]);
                high = Math.max(high, c.samples[i]);
            }
        }
        const span = Math.max(8, high - low), center = (low + high) / 2;
        return { a, b, start, end, minimum: center - span * 0.62, maximum: center + span * 0.62,
            frequency, source: input.source, referenceId: input.reference_id,
            sequence: input.sequence == null ? null : input.sequence };
    }

    const api = { preparePair };
    if (typeof module !== 'undefined' && module.exports) module.exports = api;
    root.ProbeWaveformData = api;
})(typeof window === 'undefined' ? globalThis : window);
