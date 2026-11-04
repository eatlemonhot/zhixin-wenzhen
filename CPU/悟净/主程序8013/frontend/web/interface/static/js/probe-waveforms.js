(function () {
    'use strict';
    if (window.ProbeWaveforms || !window.ProbeWaveformData) return;
    const host = document.querySelector('body > main');
    if (!host) return;
    const panel = document.createElement('section');
    panel.id = 'main-probe-waveforms-section';
    panel.className = 'pw-bottom-dock';
    panel.setAttribute('aria-label', '底部实时波形');
    panel.innerHTML = '<div class="pw-heading"><h2>实时波形</h2><span class="pw-state" role="status">等待采集</span></div>' +
        '<div class="pw-grid"><figure class="pw-box pw-a"><figcaption><span class="pw-probe-name">探针A</span><span class="pw-probe-side">左探针</span><small class="pw-unit">ADC码</small></figcaption>' +
        '<div class="pw-chart"><canvas aria-label="探针A波形，时间和幅度刻度与探针B一致"></canvas><div class="pw-empty"><span>等待探针A采集</span></div></div></figure>' +
        '<figure class="pw-box pw-b"><figcaption><span class="pw-probe-name">探针B</span><span class="pw-probe-side">右探针</span><small class="pw-unit">ADC码</small></figcaption>' +
        '<div class="pw-chart"><canvas aria-label="探针B波形，时间和幅度刻度与探针A一致"></canvas><div class="pw-empty"><span>等待探针B采集</span></div></div></figure></div>' +
        '<p class="pw-note">共用时间轴 · 同一幅度刻度</p>';
    host.insertAdjacentElement('afterend', panel);
    document.body.classList.add('pw-bottom-layout');
    const boxes = Array.from(panel.querySelectorAll('.pw-box'));
    let pair = null;

    function drawOne(box, current) {
        const canvas = box.querySelector('canvas');
        const bounds = canvas.getBoundingClientRect();
        if (bounds.width < 1 || bounds.height < 1) return;
        const dpr = window.devicePixelRatio || 1;
        canvas.width = Math.round(bounds.width * dpr);
        canvas.height = Math.round(bounds.height * dpr);
        const ctx = canvas.getContext('2d');
        ctx.scale(dpr, dpr);
        const width = bounds.width, height = bounds.height;
        const left = 44, right = 18, top = 17, bottom = 24;
        const plotWidth = width - left - right, plotHeight = height - top - bottom;
        const minimum = pair ? pair.minimum : -50, maximum = pair ? pair.maximum : 50;
        const duration = pair ? pair.end - pair.start : 0.04;
        const factor = duration < .001 ? 1e6 : duration < 1 ? 1000 : 1;
        const unit = factor === 1e6 ? 'μs' : factor === 1000 ? 'ms' : 's';
        ctx.fillStyle = '#161616';ctx.fillRect(0, 0, width, height);
        ctx.font = '10px "Microsoft YaHei",sans-serif';
        for (let i = 0; i <= 8; i++) {
            const x = left + i / 8 * plotWidth;
            ctx.strokeStyle = '#383838';ctx.lineWidth = .7;
            ctx.beginPath();ctx.moveTo(x, top);ctx.lineTo(x, top + plotHeight);ctx.stroke();
            if (i % 2 === 0 && box.classList.contains('pw-b')) {
                ctx.fillStyle = '#a8a8a8';ctx.textAlign = 'center';
                ctx.fillText((i / 8 * duration * factor).toFixed(duration * factor < 10 ? 2 : 0), x, height - 13);
            }
        }
        for (let i = 0; i <= 4; i++) {
            const y = top + i / 4 * plotHeight;
            ctx.strokeStyle = i === 2 ? '#666666' : '#383838';
            ctx.beginPath();ctx.moveTo(left, y);ctx.lineTo(left + plotWidth, y);ctx.stroke();
            if (plotHeight >= 60 || i % 2 === 0) {
                ctx.fillStyle = '#a8a8a8';ctx.textAlign = 'right';
                ctx.fillText((maximum - i / 4 * (maximum - minimum)).toFixed(0), left - 8, y + 3);
            }
        }
        ctx.fillStyle = '#bdbdbd';
        if (box.classList.contains('pw-b')) {
            ctx.textAlign = 'right';ctx.fillText('时间 / ' + unit, width - 9, height - 2);
        }
        if (!pair || !current) return;
        const first = Math.max(0, Math.floor((pair.start - current.origin) / current.step));
        const last = Math.min(current.samples.length - 1, Math.ceil((pair.end - current.origin) / current.step));
        ctx.save();ctx.beginPath();ctx.rect(left, top, plotWidth, plotHeight);ctx.clip();
        ctx.strokeStyle = box.classList.contains('pw-a') ? '#72b8f3' : '#ed9cc3';
        ctx.lineWidth = 1.35;ctx.lineJoin = 'round';ctx.beginPath();
        for (let i = first; i <= last; i++) {
            const x = left + (current.origin + i * current.step - pair.start) / duration * plotWidth;
            const y = top + (maximum - current.samples[i]) / (maximum - minimum) * plotHeight;
            if (i === first) ctx.moveTo(x, y);else ctx.lineTo(x, y);
        }
        ctx.stroke();ctx.restore();
    }

    function draw() {
        if (panel.hidden) return;
        boxes.forEach((box, index) => drawOne(box, pair && (index ? pair.b : pair.a)));
    }

    function clear(reason) {
        pair = null;
        panel.querySelector('.pw-state').textContent = reason || '等待采集';
        panel.querySelectorAll('.pw-empty').forEach(element => { element.hidden = false; });
        panel.querySelector('.pw-note').textContent = '共用时间轴 · 同一幅度刻度';
        draw();
    }

    function setPair(input) {
        try {
            const prepared = window.ProbeWaveformData.preparePair(input);
            pair = prepared;
            panel.querySelectorAll('.pw-empty').forEach(element => { element.hidden = true; });
            const names = { adc: '实际采样数据' };
            panel.querySelector('.pw-state').textContent = input.status_text||names[pair.source];
            boxes.forEach((box,index)=>{const key=index?'B':'A';box.querySelector('.pw-probe-name').textContent=input.labels?.[key]||('探针'+key);box.querySelector('.pw-probe-side').textContent=input.labels?.[key+'_side']||(index?'右探针':'左探针');box.querySelector('.pw-unit').textContent='ADC码';});
            panel.querySelector('.pw-note').textContent = '共用时间轴和幅度刻度';
            draw();
            return true;
        } catch (error) {
            clear(error.message);
            return false;
        }
    }

    function hide() {
        panel.hidden = true;
        document.body.classList.remove('pw-bottom-layout');
    }

    function show() {
        document.body.classList.add('pw-bottom-layout');
        panel.hidden = false;
        requestAnimationFrame(draw);
    }

    new ResizeObserver(draw).observe(panel);
    new ResizeObserver(() => window.dispatchEvent(new Event('resize'))).observe(host);
    window.addEventListener('probe-waveform-pair', event => setPair(event.detail));
    window.addEventListener('probe-waveform-clear', () => clear());
    window.ProbeWaveforms = { setPair, clear, show, hide };
})();
