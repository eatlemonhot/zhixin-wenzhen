// Exercise the real pulse editor with a fake DOM and fake register service.
// No network, USB, SDK, physical PWM or ADC operations are performed.
'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const source = fs.readFileSync(path.join(__dirname, '../interface/static/js/servo-control.js'), 'utf8');
const clone = object => JSON.parse(JSON.stringify(object));
const tick = () => new Promise(resolve => setImmediate(resolve));

async function harness({online = true, revision = 124, available = true} = {}) {
    const nodes = [], posts = [], timers = [], events = new Map();
    class Element {
        constructor(tag) { this.tag = tag;this.children = [];this.value = '';this.dataset = {};this.checked = false;nodes.push(this); }
        append(...items) { for (const item of items) {item.parentElement = this;this.children.push(item);if (this.tag === 'select' && this.children.length === 1) this.value = item.value;} }
        prepend(item) {item.parentElement = this;this.children.unshift(item);}
        setAttribute(key, value) {this[key] = value;}
        removeAttribute(key) {delete this[key];}
        insertAdjacentElement(_where, item) {this.parentElement.append(item);}
    }
    const document = {readyState: 'complete', createElement: tag => new Element(tag), getElementById: id => nodes.find(node => node.id === id)};
    const root = new Element('section');root.id = 'control-section';
    for (const side of ['left','right']) for (const action of ['probe','bottom']) {
        const wrapper = new Element('div');root.append(wrapper);const button = new Element('button');
        button.id = side + '-move-' + action + '-button';wrapper.append(button);
    }
    const state = {available, revision, min_us: revision === 123 ? 1500 : 900, max_us: 2100,
        frequency_hz: 333.000333, error_code: 0, channels: available ? [1,2].map(channel => ({
            channel, up_us: revision === 123 ? 1500 : 900, down_us: 2100,
            active_us: revision === 123 ? 1500 : 900, enabled: false, pending: false, selected_position: 'up'})) : []};
    const cycle = {state: 'idle', busy: false};
    const window = {probeWorkbench: {online}, addEventListener: (event, handler) => events.set(event, handler)};
    let reject = false, deferred = false, release;
    const fetch = async (url, options = {}) => {
        if (!options.method) return {ok: true, json: async () => clone(url.endsWith('/status') ? state : cycle)};
        const body = JSON.parse(options.body);posts.push({url, body});
        if (deferred) {deferred = false;await new Promise(resolve => {release = resolve;});}
        if (reject) {reject = false;return {ok: false, json: async () => ({error: 'fake save failure'})};}
        const action = url.split('/').pop();
        if (action === 'configure') {
            Object.assign(state.channels.find(row => row.channel === body.channel), {up_us: body.up_us, down_us: body.down_us});
        } else if (action === 'up' || action === 'down') {
            const row = state.channels.find(item => item.channel === body.channel);
            row.active_us = row[action + '_us'];row.selected_position = action;row.enabled = true;
        } else if (action === 'stop') {
            for (const row of state.channels) if (body.channel === 3 || row.channel === body.channel) row.enabled = false;
        }
        return {ok: true, json: async () => clone(state)};
    };
    vm.runInNewContext(source, {document, window, fetch, setTimeout: callback => timers.push(callback)});
    await tick();
    return {get: document.getElementById, posts, state, cycle,
        async poll() {await timers.shift()();await tick();},
        online(value) {window.probeWorkbench.online = value;events.get('execution-mode-changed')();},
        rejectNext() {reject = true;}, deferNext() {deferred = true;}, release() {release();}};
}

let passed = 0;
async function check(name, run) {await run();passed += 1;console.log('ok', name);}
function set(h, id, value) {const field = h.get(id);field.value = String(value);field.oninput();}

(async () => {
    await check('cached status never posts or moves; unread editor stays disabled', async () => {
        const h = await harness({available:false});assert.deepEqual(h.posts, []);
        assert.equal(h.get('servo-up_us-1').disabled, true);assert.equal(h.get('servo-up-1').disabled, true);
    });
    await check('readback exposes exact endpoints and range without changing output', async () => {
        const h = await harness();assert.equal(h.get('servo-up_us-1').value, '900');
        assert.equal(h.get('servo-down_us-2').value, '2100');assert.equal(h.get('servo-up_us-1-range').min, '900');
        assert.equal(h.get('servo-up_us-1-range').max, '2100');assert.equal(h.get('servo-save-1').disabled, true);
        assert.match(h.get('servo-state-1').textContent, /900/);assert.equal(h.state.channels[0].enabled, false);
    });
    await check('typing and dragging edit only drafts, both trial entry points are blocked', async () => {
        const h = await harness();set(h, 'servo-up_us-1', 1100);set(h, 'servo-down_us-1-range', 2000);
        assert.deepEqual(h.posts, []);assert.equal(h.get('servo-up_us-1').value, '1100');
        assert.equal(h.get('servo-down_us-1').value, '2000');assert.equal(h.get('servo-up-1').disabled, true);
        assert.equal(h.get('servo-down-1').disabled, true);assert.equal(h.get('left-move-probe-button').disabled, true);
        await h.get('servo-up-1').onclick();await h.get('left-move-probe-button').onclick();assert.deepEqual(h.posts, []);
    });
    await check('cache polling preserves an unfocused unsaved draft', async () => {
        const h = await harness();set(h, 'servo-up_us-1', 1099);await h.poll();
        assert.equal(h.get('servo-up_us-1').value, '1099');assert.match(h.get('servo-draft-1').textContent, /未保存/);
        assert.equal(h.get('servo-up_us-1-saved').textContent, '已保存：900 µs');
    });
    await check('step controls use selected integer step and clamp at readback limits', async () => {
        const h = await harness();h.get('servo-step-1').value = '25';h.get('servo-up_us-1-plus').onclick();
        assert.equal(h.get('servo-up_us-1').value, '925');h.get('servo-step-1').value = '50';
        h.get('servo-up_us-1-minus').onclick();assert.equal(h.get('servo-up_us-1').value, '900');
        h.get('servo-down_us-1-plus').onclick();assert.equal(h.get('servo-down_us-1').value, '2100');
        h.get('servo-step-1').value = '1';h.get('servo-up_us-1-plus').onclick();assert.equal(h.get('servo-up_us-1').value, '901');
        assert.deepEqual(h.posts, []);
    });
    await check('a target can begin from the last active pulse without applying it', async () => {
        const h = await harness();h.get('servo-down_us-1-use-active').onclick();
        assert.equal(h.get('servo-down_us-1').value, '900');assert.equal(h.state.channels[0].down_us, 2100);
        assert.equal(h.get('servo-down_us-2').value, '2100');assert.deepEqual(h.posts, []);
    });
    await check('invalid values never reach configuration even by forced handler calls', async () => {
        const h = await harness();for (const value of ['', ' ', '899', '2101', '1000.5', 'NaN', 'Infinity']) {
            set(h, 'servo-up_us-1', value);assert.equal(h.get('servo-save-1').disabled, true);
            await h.get('servo-save-1').onclick();assert.deepEqual(h.posts, []);
        }
    });
    await check('saving is one configure request for the selected channel and never a position command', async () => {
        const h = await harness();set(h, 'servo-up_us-1', 1100);set(h, 'servo-down_us-1', 2000);
        await h.get('servo-save-1').onclick();assert.deepEqual(h.posts, [{url:'/motor/servo/configure',body:{channel:1,up_us:1100,down_us:2000}}]);
        assert.equal(h.state.channels[0].active_us, 900);assert.equal(h.state.channels[0].enabled, false);
        assert.equal(h.state.channels[1].up_us, 900);assert.equal(h.get('servo-save-1').disabled, true);
        assert.equal(h.get('servo-up-1').disabled, false);assert.match(h.get('servo-up-1').textContent, /1100/);
    });
    await check('single trial uses saved endpoint and reads actual active pulse', async () => {
        const h = await harness();set(h,'servo-up_us-1',1100);await h.get('servo-save-1').onclick();
        await h.get('servo-up-1').onclick();assert.deepEqual(h.posts[1], {url:'/motor/servo/up',body:{channel:1}});
        assert.match(h.get('servo-state-1').textContent, /PWM输出：1100/);
        await h.get('servo-down-2').onclick();assert.deepEqual(h.posts[2], {url:'/motor/servo/down',body:{channel:2}});
    });
    await check('endpoint names never impose an unverified mechanical pulse direction', async () => {
        const h = await harness();set(h,'servo-up_us-1',1800);set(h,'servo-down_us-1',1200);
        await h.get('servo-save-1').onclick();assert.deepEqual(h.posts, [{url:'/motor/servo/configure',body:{channel:1,up_us:1800,down_us:1200}}]);
        assert.match(h.get('servo-draft-1').textContent, /600/);
    });
    await check('pending requests cannot duplicate a position command', async () => {
        const h = await harness();h.deferNext();const first = h.get('servo-up-1').onclick();await tick();
        await h.get('servo-up-1').onclick();assert.equal(h.posts.length, 1);h.release();await first;
    });
    await check('failed save retains draft, does not retry, and blocks trials', async () => {
        const h = await harness();set(h,'servo-up_us-1',1100);h.rejectNext();await h.get('servo-save-1').onclick();
        assert.equal(h.posts.length, 1);assert.equal(h.get('servo-up_us-1').value, '1100');
        assert.equal(h.get('servo-up-1').disabled, true);await h.poll();assert.equal(h.posts.length, 1);
    });
    await check('restore changes only the draft and follows external readback changes', async () => {
        const h = await harness();set(h,'servo-up_us-1',1100);h.state.channels[0].up_us = 1000;await h.poll();
        assert.equal(h.get('servo-up_us-1').value, '1100');h.get('servo-restore-1').onclick();
        assert.equal(h.get('servo-up_us-1').value, '1000');assert.deepEqual(h.posts, []);
    });
    await check('offline and measurement ownership disable all pulse editing and trial requests', async () => {
        const h = await harness();h.online(false);assert.equal(h.get('servo-up_us-1').disabled, true);
        await h.get('servo-up-1').onclick();assert.deepEqual(h.posts, []);
        h.online(true);h.cycle.busy = true;h.cycle.state = 'waiting_lowered';await h.poll();
        assert.equal(h.get('servo-save-1').disabled, true);await h.get('servo-up-1').onclick();assert.deepEqual(h.posts, []);
    });
    await check('channel stop remains usable offline and with unsaved endpoints', async () => {
        const h = await harness();set(h,'servo-up_us-1',1100);h.online(false);assert.equal(h.get('servo-stop-1').disabled, false);
        await h.get('servo-stop-1').onclick();assert.deepEqual(h.posts, [{url:'/motor/servo/stop',body:{channel:1}}]);
    });
    await check('actual 123 range is retained rather than expanded to 900', async () => {
        const h = await harness({revision:123});assert.equal(h.get('servo-up_us-1').min, '1500');
        h.get('servo-up_us-1-minus').onclick();assert.equal(h.get('servo-up_us-1').value, '1500');
        set(h,'servo-up_us-1',1400);await h.get('servo-save-1').onclick();assert.deepEqual(h.posts, []);
    });
    await check('未保存端点阻止周期，保存后按共享边界启动', async () => {
        const h = await harness();set(h,'servo-up_us-1',1100);assert.equal(h.get('servo-cycle-start').disabled, true);
        await h.get('servo-cycle-start').onclick();assert.deepEqual(h.posts, []);
        await h.get('servo-save-1').onclick();assert.equal(h.get('servo-cycle-start').disabled, false);
        assert.match(h.get('servo-cycle-message').textContent, /自动抬针/);
        await h.get('servo-cycle-start').onclick();assert.equal(h.posts.length, 2);assert.equal(h.state.channels[0].up_us,1100);
    });
    await check('XY manual raised confirmation removed while measurement confirmation remains', async () => {
        const h = await harness();
        assert.equal(h.get('servo-confirm-raised'), undefined);
        assert.ok(h.get('servo-cycle-confirm'));
        assert.deepEqual(h.posts, []);
    });
    console.log(passed + ' PWM endpoint editor checks passed (mock DOM/HTTP; no hardware).');
})().catch(error => {console.error(error);process.exitCode = 1;});
