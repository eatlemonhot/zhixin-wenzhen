(function () {
    'use strict';
    function initialise() {
        if (document.getElementById('servo-summary')) return;
        const controls = document.getElementById('control-section');
        if (!controls) return;
        let state = {available: false, channels: []}, cycle = {state: 'idle', busy: false};
        let pending = false, notice = '';
        const groups = [];
        function create(tag, text, className) {
            const element = document.createElement(tag);
            if (text) element.textContent = text;
            if (className) element.className = className;
            return element;
        }
        const summary = create('section', '', 'servo-summary');
        summary.id = 'servo-summary';
        const headline = create('strong', '舵机 PWM');
        const message = create('p', '正在读取网页缓存…');
        message.setAttribute('role', 'status');
        const read = create('button', '读取舵机状态', 'clickable');
        read.id = 'servo-read';read.type = 'button';
        const stopAll = create('button', '双路停波', 'clickable');
        stopAll.id = 'servo-stop-all';stopAll.type = 'button';
        const clear = create('button', '清除舵机错误', 'clickable');
        clear.id = 'servo-clear-error';clear.type = 'button';
        summary.append(headline, message, read, stopAll, clear);
        const timing = create('p', '读取状态后显示允许脉宽与PWM周期。', 'servo-timing');
        summary.append(create('p', '所有XY移动会自动核验双针抬起；已抬起并等待过的同一指令直接复用，无需手动确认。'), timing, create('small', 'µs是PWM高电平脉宽，不是毫米。实际抬落距离需观察机构标定；更改滑块或数字不会自动动作。'));
        const motorToolbar = document.getElementById('motor-controls');
        if (motorToolbar) motorToolbar.insertAdjacentElement('afterend', summary);else controls.prepend(summary);

        function limits() {
            return {min: Number.isInteger(state.min_us) ? state.min_us : 900,
                max: Number.isInteger(state.max_us) ? state.max_us : 2100};
        }
        function channelState(group) { return state.channels?.find(item => item.channel === group.channel); }
        function canEdit(group) {
            const row = channelState(group);
            return Boolean(state.available && row && !row.pending && online() && !pending && !cycle.busy && !state.error_code);
        }
        function draft(group) {
            const bounds = limits(), row = channelState(group);
            const values = group.fields.map(input => Number(input.value));
            const valid = group.fields.every((input, index) => input.value.trim() !== '' &&
                Number.isInteger(values[index]) && values[index] >= bounds.min && values[index] <= bounds.max);
            return {values, valid, dirty: Boolean(row && (values[0] !== row.up_us || values[1] !== row.down_us))};
        }
        function edit(group, index, value) {
            if (!canEdit(group)) return;
            group.fields[index].value = String(value);
            notice = '';render();
        }
        function adjust(group, index, sign) {
            if (!canEdit(group)) return;
            const value = Number(group.fields[index].value), step = Number(group.step.value), bounds = limits();
            if (!group.fields[index].value.trim() || !Number.isInteger(value) || ![1,5,10,25,50].includes(step)) return;
            edit(group, index, Math.max(bounds.min, Math.min(bounds.max, value + sign * step)));
        }
        function defaultCyclePresets() {
            return [1,2].every(channel => state.channels?.some(row => row.channel === channel)) &&
                groups.every(group => {const value = draft(group);return value.valid && !value.dirty;});
        }

        for (const [side, channel] of [['left', 1], ['right', 2]]) {
            const down = document.getElementById(side + '-move-probe-button');
            const bottom = document.getElementById(side + '-move-bottom-button');
            if (!down || !bottom) continue;
            down.textContent = (side==='left'?'左针':'右针')+'落针';down.type = 'button';
            down.removeAttribute('aria-label');down.title = '通过PWM落针';
            const panel = create('div', '', 'servo-channel');
            panel.id = 'servo-channel-' + channel;
            const label = create('small', (channel === 1 ? '左针 · 舵机通道1 · J17-21' : '右针 · 舵机通道2 · J17-23'));
            const up = create('button', '试抬针', 'clickable');up.type = 'button';up.id = 'servo-up-' + channel;
            const tryDown = create('button', '试落针', 'clickable');tryDown.type = 'button';tryDown.id = 'servo-down-' + channel;
            const stop = create('button', '停止PWM输出', 'clickable');stop.type = 'button';stop.id = 'servo-stop-' + channel;
            const output = create('p', '尚未读取PWM状态');output.id = 'servo-state-' + channel;
            const details = create('details');details.open = false;details.append(create('summary', 'PWM端点与单步调试'));
            const stepLabel = create('label', '±调节步长');
            const step = create('select');step.id = 'servo-step-' + channel;
            step.setAttribute('aria-label', (side === 'left' ? '左针' : '右针') + 'PWM调节步长');
            for (const amount of [1,5,10,25,50]) {
                const option = create('option', amount + ' µs');option.value = String(amount);step.append(option);
            }
            step.value = '10';stepLabel.append(step);details.append(stepLabel);
            const group = {channel, side, down, up, tryDown, stop, output, fields: [], ranges: [],
                saved: [], adjusters: [], step, initialised: false};
            for (const [index, key, name] of [[0, 'up_us', '抬针端点'], [1, 'down_us', '落针端点']]) {
                const section = create('section', '', 'servo-pulse-editor');
                const inputId = 'servo-' + key + '-' + channel;
                const fieldLabel = create('label', name + '（µs）');fieldLabel.htmlFor = inputId;
                const input = create('input');input.type = 'number';input.step = '1';input.placeholder = '先读取状态';
                input.id = 'servo-' + key + '-' + channel;
                input.setAttribute('aria-label', (side === 'left' ? '左针' : '右针') + name + '脉宽（微秒）');
                const minus = create('button', '−', 'clickable');minus.type = 'button';minus.id = inputId + '-minus';
                const plus = create('button', '+', 'clickable');plus.type = 'button';plus.id = inputId + '-plus';
                minus.setAttribute('aria-label', (side === 'left' ? '左针' : '右针') + name + '减少一个步长');
                plus.setAttribute('aria-label', (side === 'left' ? '左针' : '右针') + name + '增加一个步长');
                const numeric = create('div', '', 'servo-pulse-numeric');numeric.append(minus, input, plus);
                const range = create('input');range.type = 'range';range.step = '1';range.id = inputId + '-range';
                range.setAttribute('aria-label', (side === 'left' ? '左针' : '右针') + name + '脉宽滑块');
                const saved = create('small', '已保存：待读取');saved.id = inputId + '-saved';
                const useReadback = create('button', '从回读脉宽开始调节', 'clickable');useReadback.type = 'button';useReadback.id = inputId + '-use-active';
                section.append(fieldLabel, numeric, range, saved, useReadback);details.append(section);
                group.fields.push(input);group.ranges.push(range);group.saved.push(saved);group.adjusters.push(minus, plus, useReadback);
                input.oninput = input.onchange = () => { if (canEdit(group)) {notice = '';render();} };
                range.oninput = () => edit(group, index, range.value);
                minus.onclick = () => adjust(group, index, -1);plus.onclick = () => adjust(group, index, 1);
                useReadback.onclick = () => {
                    const value = channelState(group)?.active_us, bounds = limits();
                    if (Number.isInteger(value) && value >= bounds.min && value <= bounds.max) edit(group, index, value);
                };
            }
            const draftStatus = create('p', '', 'servo-draft-status');draftStatus.id = 'servo-draft-' + channel;
            draftStatus.setAttribute('role', 'status');
            const save = create('button', '保存端点（不动作）', 'clickable');save.type = 'button';save.id = 'servo-save-' + channel;
            const restore = create('button', '恢复已保存的值', 'clickable');restore.type = 'button';restore.id = 'servo-restore-' + channel;
            Object.assign(group, {save, restore, draftStatus});
            details.append(draftStatus, save, restore);
            const actions = create('div', '', 'servo-trial-actions');actions.append(up, tryDown, stop);
            panel.append(label, output, details, actions);
            bottom.parentElement.insertAdjacentElement('afterend', panel);
            down.onclick = () => command('down', {channel});
            tryDown.onclick = () => command('down', {channel});
            up.onclick = () => command('up', {channel});
            stop.onclick = () => command('stop', {channel});
            save.onclick = () => {
                if (!canEdit(group)) return;
                const value = draft(group), bounds = limits();
                if (!value.valid) {
                    notice = '两端脉宽必须为' + bounds.min + '～' + bounds.max + ' µs的整数。';render();return;
                }
                return command('configure', {channel, up_us: value.values[0], down_us: value.values[1]});
            };
            restore.onclick = () => {
                if (!canEdit(group)) return;
                const row = channelState(group);group.fields[0].value = String(row.up_us);group.fields[1].value = String(row.down_us);
                notice = '';render();
            };
            groups.push(group);
        }

        const cyclePanel = create('section', '', 'servo-cycle');cyclePanel.id = 'servo-cycle';
        const cycleTitle = create('strong', '单通路原码验收（非完整ABCA）');
        const cycleNote = create('p', '落针 → 确认到位 → 当前通路ADC采集 → 抬针 → 确认抬起');
        const channelSelect = create('select');channelSelect.id = 'servo-cycle-channel';channelSelect.setAttribute('aria-label', '周期探针');
        for (const [value, name] of [['3', '双通道'], ['1', '通道1'], ['2', '通道2']]) {
            const option = create('option', name);option.value = value;channelSelect.append(option);
        }
        const windowSelect = create('select');windowSelect.id = 'servo-cycle-window';windowSelect.setAttribute('aria-label', '采样窗口');
        for (const [value, name] of [['0', '0.328 ms'], ['4', '5.24 ms'], ['8', '83.89 ms']]) {
            const option = create('option', name);option.value = value;windowSelect.append(option);
        }
        const startCycle = create('button', '开始落针测量', 'clickable');startCycle.id = 'servo-cycle-start';startCycle.type = 'button';
        const confirm = create('button', '确认探针已到位', 'clickable');confirm.id = 'servo-cycle-confirm';confirm.type = 'button';
        const cancel = create('button', '取消并抬针', 'clickable');cancel.id = 'servo-cycle-cancel';cancel.type = 'button';
        const cycleMessage = create('p', '需要124位流。');cycleMessage.id = 'servo-cycle-message';cycleMessage.setAttribute('role', 'status');
        const download = create('a', '下载本次ADC原码');download.href = '/motor/servo/cycle/files/capture.bin';download.hidden = true;
        cyclePanel.append(cycleTitle, cycleNote, channelSelect, windowSelect, startCycle, confirm, cancel, cycleMessage, download,
            create('small', '单次8192点，保持当前激励和测量通路。请先确认接线与测量设置；此周期不自动执行整板故障诊断。'));
        controls.append(cyclePanel);
        const stagedPanel = create('section', '', 'servo-cycle');
        const dacChannel = create('select');dacChannel.id='servo-staged-dac';dacChannel.setAttribute('aria-label', 'DAC针舵机通道');
        for (const [value, name] of [['', '选择本轮激励针'], ['1', '左针激励，右针采样'], ['2', '右针激励，左针采样']]) {
            const option = create('option', name);option.value = value;dacChannel.append(option);
        }
        const wiring=create('select');wiring.id='servo-left-terminal';wiring.setAttribute('aria-label','左针继电器端子接线');
        for(const [value,name] of [['','核对左针实际端子'],['TP_A','左针接TP_A，右针接TP_B'],['TP_B','左针接TP_B，右针接TP_A']]){const option=create('option',name);option.value=value;wiring.append(option);}
        const rsSelect = create('select');rsSelect.id='servo-staged-rs';rsSelect.setAttribute('aria-label', 'Rs档位');
        for (const [value, name] of [['100', 'Rs 100Ω'], ['10000', 'Rs 10kΩ']]) {const option = create('option', name);option.value=value;rsSelect.append(option);}
        const ground = create('input');ground.id='servo-staged-ground';ground.type='checkbox';const groundLabel=create('label', '已确认固定共地');groundLabel.prepend(ground);
        const positioned = create('input');positioned.id='servo-staged-positioned';positioned.type='checkbox';const positionedLabel=create('label', '双针抬起，XY已到目标，通道对应已核对');positionedLabel.prepend(positioned);
        const stagedStart=create('button','执行分阶段A/B/C/A_check原码验收','clickable');stagedStart.type='button';stagedStart.id='servo-staged-start';
        const stagedDownload=create('a','下载分阶段原码与证据');stagedDownload.href='/motor/servo/cycle/files/staged_raw.zip';stagedDownload.hidden=true;
        stagedPanel.append(create('strong','固定共地 · 分阶段双针验收'),create('p','DAC针先落下测VA/VB；ADC针落下测C；抬ADC针复测VA。沿用已配置激励，每路16帧；到位逐步人工确认。'),wiring,dacChannel,rsSelect,groundLabel,positionedLabel,stagedStart,stagedDownload);
        controls.append(stagedPanel);

        function online() { return Boolean(window.probeWorkbench?.online); }
        function render() {
            const ready = state.available && online() && !pending && !cycle.busy && !state.error_code;
            message.textContent = notice || state.message || '请读取舵机状态。';
            headline.textContent = state.available ? '舵机 PWM · '+({unknown:'状态未知',raising:'正在抬起',up:'已核验抬起',down:'落针状态',fault:'异常'}[state.probe_state]||'待核验')+' · ' + state.revision + ' · ' + state.frequency_hz.toFixed(1) + ' Hz' : '舵机 PWM · 等待配套';
            const bounds = limits();
            timing.textContent = state.available ? '允许 ' + bounds.min + '～' + bounds.max + ' µs · 脉宽步进1 µs · PWM周期约' +
                Math.round(1000000 / state.frequency_hz) + ' µs。' : '先点击“读取舵机状态”，再编辑端点；读取状态不发位置指令。';
            read.disabled = pending || cycle.busy;
            stopAll.disabled = pending || (!state.available && !cycle.busy);
            clear.hidden = !state.error_code;clear.disabled = pending || !online() || cycle.busy;
            for (const group of groups) {
                const row = channelState(group);
                if (row && !group.initialised) {
                    group.fields[0].value = String(row.up_us);group.fields[1].value = String(row.down_us);group.initialised = true;
                }
                const value = draft(group), editable = canEdit(group);
                group.down.disabled = group.up.disabled = group.tryDown.disabled = !editable || !value.valid || value.dirty;
                group.save.disabled = !editable || !value.valid || !value.dirty;
                group.restore.disabled = !editable || !value.dirty;
                group.step.disabled = !editable;
                group.stop.disabled = pending || !state.available || cycle.busy;
                group.output.textContent = row ? (row.enabled ? 'PWM输出：' : 'PWM已停波；脉宽回读：') + row.active_us + ' µs · ' +
                    (row.selected_position === 'up' ? '抬针指令' : '落针指令') + (row.pending ? ' · 等待提交' : '') + '；实际到位需观察确认。' : '尚未读取PWM状态';
                group.up.textContent = '试抬针' + (row ? ' · ' + row.up_us + ' µs' : '');
                group.tryDown.textContent = '试落针' + (row ? ' · ' + row.down_us + ' µs' : '');
                group.down.title = row ? '按已保存落针端点 ' + row.down_us + ' µs动作；修改端点后需先保存' : '请先读取舵机状态';
                group.fields.forEach((input, index) => {
                    input.disabled = !editable;input.min = String(bounds.min);input.max = String(bounds.max);
                    input.setAttribute('aria-invalid', String(group.initialised && !value.valid));
                    const range = group.ranges[index];range.disabled = !editable;range.min = input.min;range.max = input.max;
                    if (Number.isInteger(value.values[index]) && value.values[index] >= bounds.min && value.values[index] <= bounds.max) range.value = input.value;
                    group.saved[index].textContent = row ? '已保存：' + row[index === 0 ? 'up_us' : 'down_us'] + ' µs' : '已保存：待读取';
                });
                group.adjusters.forEach(button => { button.disabled = !editable; });
                group.draftStatus.textContent = !row ? '待读取当前端点。' : !value.valid ? '请输入允许范围内的整数微秒。' :
                    (value.dirty ? '未保存：先保存端点，再试抬/试落。' : '与已保存值一致，可单次试抬/试落。') +
                    ' 脉宽跨度 ' + Math.abs(value.values[1] - value.values[0]) + ' µs（不是毫米）。';
                group.draftStatus.setAttribute('data-dirty', String(value.dirty));
            }
            const cyclePresets = defaultCyclePresets();
            startCycle.disabled = !ready || state.revision !== 124 || !cyclePresets;
            stagedStart.disabled = !ready || state.revision !== 124 || !cyclePresets || !dacChannel.value || !wiring.value || !ground.checked || !positioned.checked;
            for (const field of [wiring,dacChannel,rsSelect,ground,positioned]) field.disabled=cycle.busy||pending;
            stagedDownload.hidden=cycle.busy||!cycle.measurement?.raw_only;
            channelSelect.disabled = windowSelect.disabled = cycle.busy || pending;
            confirm.hidden = !['waiting_lowered', 'waiting_raised'].includes(cycle.state);
            confirm.disabled = pending;
            confirm.textContent = cycle.state === 'waiting_raised' ? '确认探针已抬起' : '确认落针到位，开始采集';
            cancel.disabled = !cycle.busy || pending;
            cycleMessage.textContent = cycle.state === 'idle' ? (state.revision === 124 ?
                (cyclePresets ? '周期使用与自动抬针相同的已保存端点，按所选探针执行一次真实ADC采集。' : '请先保存有效端点；测量周期与自动抬针共用已保存边界。') :
                '加载124位流后开放；当前不执行落针。') : cycle.message || '周期处理中…';
            if (cycle.measurement && !cycle.measurement.raw_only && cycle.state === 'completed') {
                cycleMessage.textContent += ' 已保存 ' + cycle.measurement.samples + ' 点，ADC码 ' + cycle.measurement.minimum_code + '～' + cycle.measurement.maximum_code + '。';
            }
            download.hidden = cycle.busy || !cycle.measurement || cycle.measurement.raw_only;
        }

        async function request(path, body) {
            const response = await fetch('/motor/servo/' + path, {method: 'POST', credentials: 'same-origin',
                headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'}, body: JSON.stringify(body)});
            const result = await response.json();
            if (!response.ok) { if (result.state) state = result.state;throw Error(result.error || '舵机请求失败。'); }
            return result;
        }
        async function command(action, body = {}) {
            if (pending) return;
            if (['up', 'down', 'configure'].includes(action)) {
                const group = groups.find(item => item.channel === body.channel);
                if (!group || !canEdit(group)) { notice = '请先读取状态并切换实机模式，等待当前任务结束。';render();return; }
                const value = draft(group);
                if (!value.valid || (action !== 'configure' && value.dirty)) { notice = '请先保存有效端点，再试抬/试落。';render();return; }
            }
            pending = true;notice = '';render();
            try {
                const result = await request(action, body);
                if (result.channels) state = result;else cycle = result;
                if (['up', 'down'].includes(action)) notice = '单次位置指令已提交，请观察探针是否到位；读回脉宽不代表机械到位。';
                if (action === 'configure') notice = '端点已保存并读回，未发送位置命令；可再单击试抬/试落。';
            } catch (error) { notice = error.message; }
            finally { pending = false;render(); }
        }
        async function cycleCommand(action, body) {
            if (pending) return;
            if (action === 'start' && !defaultCyclePresets()) { notice = '请先保存有效端点；测量周期与自动抬针共用已保存边界。';render();return; }
            pending = true;notice = '';render();
            try {
                cycle = await request('cycle/' + action, body);
                if (action === 'start') {
                    const response = await fetch('/motor/servo/status', {credentials: 'same-origin'});
                    if (response.ok) {
                        state = await response.json();groups.forEach(group => { group.initialised = false; });
                    }
                }
            }
            catch (error) { notice = error.message; }
            finally { pending = false;render(); }
        }
        read.onclick = () => command('read');
        stopAll.onclick = () => command('stop', {channel: 3});
        clear.onclick = () => command('clear-error');
        startCycle.onclick = () => cycleCommand('start', {channel: Number(channelSelect.value), decimation_log2: Number(windowSelect.value)});
        stagedStart.onclick = () => cycleCommand('start', {kind:'staged_abca',dac_channel:Number(dacChannel.value),adc_channel:3-Number(dacChannel.value),left_terminal:wiring.value,rs_ohm:Number(rsSelect.value),decimation_log2:Number(windowSelect.value),frames:16,fixed_ground_confirmed:ground.checked,xy_position_confirmed:positioned.checked});
        for(const field of [wiring,dacChannel,rsSelect,ground,positioned]) field.onchange=render;
        confirm.onclick = () => cycleCommand('confirm', {sequence: cycle.sequence, position: cycle.state === 'waiting_raised' ? 'raised' : 'lowered'});
        cancel.onclick = () => cycleCommand('cancel', {});
        async function poll() {
            if (!pending) {
                try {
                    const [statusResponse, cycleResponse] = await Promise.all([fetch('/motor/servo/status', {credentials: 'same-origin'}), fetch('/motor/servo/cycle', {credentials: 'same-origin'})]);
                    if (statusResponse.ok && cycleResponse.ok) {
                        const nextCycle = await cycleResponse.json();
                        const finished = cycle.busy && !nextCycle.busy;
                        state = await statusResponse.json();cycle = nextCycle;render();
                        if (finished) void command('read');
                    }
                } catch (_) { message.textContent = '网页连接中断，请恢复连接后读取状态。'; }
            }
            setTimeout(poll, 1500);
        }
        window.addEventListener('execution-mode-changed', render);
        render();void poll();
    }
    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', initialise, {once: true});else initialise();
}());

