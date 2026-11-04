"use strict";
const assert = require("node:assert/strict");
const fs = require("node:fs");
const path = require("node:path");
const vm = require("node:vm");

const source = fs.readFileSync(path.join(__dirname, "../interface/static/js/motor-control.js"), "utf8");
const statusSource = fs.readFileSync(path.join(__dirname, "../interface/static/js/motor-status.js"), "utf8");
const template = fs.readFileSync(path.join(__dirname, "../interface/templates/base.html"), "utf8");

function harness(initialState = {}) {
    const elements = [];
    const events = new Map();
    const intervals = [];
    const posts = [];
    let reads = 0;
    let state = Object.assign({ available: true, connected: true, ready: false,
        busy: false, stopped: false, positions_mm: {}, last_job: null }, initialState);
    class Element {
        constructor(tagName) {
            this.tagName = tagName.toUpperCase();
            this.children = [];
            this.listeners = new Map();
            this.disabled = false;
            this.textContent = "";
            this.value = "1";
            elements.push(this);
        }
        append(...children) { children.forEach(child => this.appendChild(child)); }
        appendChild(child) { child.parent = this; this.children.push(child); return child; }
        prepend(child) { child.parent = this; this.children.unshift(child); }
        setAttribute(name, value) { this[name] = value; }
        querySelector(selector) { return this.children.find(child => child.tagName.toLowerCase() === selector) || null; }
        insertAdjacentElement(_where, child) {
            child.parent = this.parent;
            this.parent.children.splice(this.parent.children.indexOf(this) + 1, 0, child);
        }
        addEventListener(event, callback) {
            if (!this.listeners.has(event)) this.listeners.set(event, []);
            this.listeners.get(event).push(callback);
        }
        click() {
            (this.listeners.get("click") || []).forEach(callback => callback({ preventDefault() {} }));
        }
    }
    const document = {
        readyState: "complete",
        head: new Element("head"),
        createElement: tag => new Element(tag),
        getElementById: id => elements.find(element => element.id === id) || null
    };
    const section = new Element("section");
    section.id = "control-section";
    section.appendChild(new Element("h2"));
    for (const probe of ["left", "right"]) {
        const label = new Element("p");
        const caption = probe === "left" ? /<p>(左臂[^<]*)<\/p>/ : /<p>(右臂[^<]*)<\/p>/;
        label.textContent = template.match(caption)[1];
        section.appendChild(label);
        for (const direction of ["top", "bottom", "left", "right", "probe"]) {
            const button = new Element("button");
            button.id = `${probe}-move-${direction}-button`;
            section.appendChild(button);
        }
    }
    const window = {
        probeWorkbench: { online: initialState.motion_enabled !== false },
        setTimeout: () => 1,
        clearTimeout() {},
        setInterval: callback => intervals.push(callback),
        addEventListener: (name, callback) => {
            if (!events.has(name)) events.set(name, []);
            events.get(name).push(callback);
        },
        dispatchEvent: event => { if (events.has(event.type)) events.get(event.type).forEach(callback => callback(event)); }
    };
    const fetch = async (url, options = {}) => {
        if (!options.method) {
            reads += 1;
            return { ok: true, status: 200, json: async () => JSON.parse(JSON.stringify(state)) };
        }
        posts.push({ url, body: JSON.parse(options.body), headers: options.headers });
        if (url === "/motor/stop") {
            state = Object.assign({}, state, { stopped: true, ready: false });
            return { ok: true, status: 200, json: async () => ({}) };
        }
        const action = url.split("/").pop();
        const job_id = "offline_" + posts.length;
        state = Object.assign({}, state, { busy: true, ready: false,
            last_job: { job_id, action, state: "running" } });
        return { ok: true, status: 202, json: async () => ({ job_id }) };
    };
    vm.runInNewContext(statusSource + "\n" + source, { document, window, fetch, AbortController,
        CustomEvent: class { constructor(type, options) { this.type = type; this.detail = options.detail; } } });
    return {
        element: document.getElementById,
        posts,
        reads: () => reads,
        settle: () => new Promise(resolve => setImmediate(resolve)),
        update: update => { state = Object.assign({}, state, update); },
        poll: () => window.motorStatus.refresh(),
        externalPending: pending => events.get("pcb-motor-pending").forEach(callback => callback({ detail: { pending } }))
    };
}

async function main() {
    let checks = 0;
    const cold = harness();
    await cold.settle();
    assert.equal(cold.reads(), 1);
    assert.deepEqual(cold.posts, []);
    assert.equal(cold.element("motor-rebuild").disabled, false);
    assert.equal(cold.element("motor-circle").disabled, true);
    assert.equal(cold.element("left-move-top-button").disabled, true);
    checks += 1;

    cold.element("motor-rebuild").click();
    cold.element("motor-rebuild").click();
    await cold.settle();
    assert.equal(cold.posts.length, 1);
    assert.equal(cold.posts[0].url, "/motor/rebuild");
    assert.deepEqual(cold.posts[0].body, {});
    assert.equal(cold.posts[0].headers["X-Requested-With"], "XMLHttpRequest");
    assert.equal(cold.element("motor-rebuild").disabled, true);
    assert.equal(cold.element("motor-circle").disabled, true);
    assert.equal(cold.element("motor-stop").disabled, false);
    assert.match(cold.element("motor-status").textContent, /坐标重建进行中/);
    checks += 1;

    cold.update({ busy: false, ready: true,
        last_job: { job_id: "offline_1", action: "rebuild", state: "completed" } });
    cold.poll();
    await cold.settle();
    assert.equal(cold.element("motor-circle").disabled, false);
    cold.element("motor-circle").click();
    cold.element("motor-circle").click();
    await cold.settle();
    assert.equal(cold.posts.length, 2);
    assert.equal(cold.posts[1].url, "/motor/circle");
    assert.deepEqual(cold.posts[1].body, {});
    assert.match(cold.element("motor-status").textContent, /移动测试进行中/);
    checks += 1;

    cold.element("motor-stop").click();
    await cold.settle();
    assert.equal(cold.posts[2].url, "/motor/stop");
    assert.equal(cold.element("motor-circle").disabled, true);
    assert.equal(cold.element("motor-rebuild").disabled, true);
    assert.equal(cold.element("motor-clear-stop").hidden, false);
    checks += 1;

    const ready = harness({ ready: true, positions_mm: { "1": 1, "2": 2, "3": 3, "4": 4 } });
    await ready.settle();
    const captions = ready.element("control-section").children.map(child => child.textContent);
    assert.ok(captions.includes("左臂（X：1号，Y：3号）"));
    assert.ok(captions.includes("右臂（X：2号，Y：4号）"));
    assert.match(ready.element("motor-positions").textContent, /左X内移（1号）: 1\.000/);
    assert.match(ready.element("motor-positions").textContent, /右X内移（2号）: 2\.000/);
    assert.match(ready.element("right-move-left-button").title, /右臂（X：2号）/);
    assert.match(ready.element("left-move-top-button").title, /左臂（Y：3号）/);
    assert.match(ready.element("right-move-top-button").title, /右臂（Y：4号）/);
    checks += 1;
    ready.externalPending(true);
    ready.element("motor-rebuild").click();
    ready.element("motor-circle").click();
    assert.equal(ready.posts.length, 0);
    assert.equal(ready.element("motor-rebuild").disabled, true);
    assert.equal(ready.element("motor-stop").disabled, false);
    ready.externalPending(false);
    ready.element("right-move-left-button").click();
    await ready.settle();
    assert.equal(ready.posts[0].url, "/motor/jog");
    assert.deepEqual(ready.posts[0].body, { probe: "right", direction: "left", step_mm: 1 });
    checks += 1;

    const unavailable = harness({ available: false, ready: true });
    await unavailable.settle();
    unavailable.element("motor-rebuild").click();
    unavailable.element("motor-circle").click();
    assert.equal(unavailable.posts.length, 0);
    assert.equal(unavailable.element("motor-rebuild").disabled, true);
    assert.equal(unavailable.element("motor-circle").disabled, true);
    checks += 1;

    const up = harness({ ready: true });
    await up.settle();
    up.element("left-move-top-button").click();
    await up.settle();
    assert.deepEqual(up.posts[0].body, { probe: "left", direction: "up", step_mm: 1 });
    assert.equal(up.element("left-move-probe-button").disabled, true);
    checks += 1;

    const limitText = "4号电机已到达2 mm软限位，请向相反方向移动。";
    const limited = harness({ ready: true, message: limitText,
        last_job: { job_id: "limited_1", action: "jog", state: "limited",
            error_code: "jog_soft_limit", notice: limitText } });
    await limited.settle();
    assert.equal(limited.element("motor-notice").textContent, limitText);
    assert.equal(limited.element("motor-notice").role, "status");
    assert.equal(limited.element("motor-error").hidden, true);
    assert.equal(limited.element("right-move-top-button").disabled, false);
    assert.equal(limited.element("right-move-bottom-button").disabled, false);
    assert.equal(limited.element("motor-circle").disabled, false);
    assert.ok(!limited.element("motor-status").textContent.includes(limitText));
    checks += 1;

    const limitReads = limited.reads();
    limited.element("motor-dismiss-message").click();
    await limited.settle();
    assert.equal(limited.reads(), limitReads);
    assert.equal(limited.posts.length, 0);
    assert.equal(limited.element("motor-notice").hidden, true);
    assert.equal(limited.element("motor-dismiss-message").hidden, true);
    assert.equal(limited.element("right-move-top-button").disabled, false);
    assert.equal(limited.element("motor-clear-stop").hidden, true);
    limited.poll();
    await limited.settle();
    assert.equal(limited.element("motor-notice").hidden, true);
    limited.update({ last_job: { job_id: "limited_2", action: "jog", state: "limited",
        notice: limitText } });
    limited.poll();
    await limited.settle();
    assert.equal(limited.element("motor-notice").hidden, false);
    assert.equal(limited.element("motor-dismiss-message").hidden, false);
    checks += 1;

    const failed = harness({ ready: false,
        last_job: { job_id: "failed_1", action: "jog", state: "failed", error: "读取参考失败" } });
    await failed.settle();
    assert.match(failed.element("motor-error").textContent, /检查电机/);
    assert.equal(failed.element("motor-check").disabled, false);
    assert.equal(failed.element("right-move-top-button").disabled, true);
    assert.equal(failed.element("motor-dismiss-message").hidden, false);
    const failedReads = failed.reads();
    failed.element("motor-dismiss-message").click();
    await failed.settle();
    assert.equal(failed.reads(), failedReads);
    assert.equal(failed.posts.length, 0);
    assert.equal(failed.element("motor-error").hidden, true);
    assert.equal(failed.element("right-move-top-button").disabled, true);
    failed.update({ last_job: { job_id: "failed_2", action: "check", state: "failed", error: "新的参考错误" } });
    failed.poll();
    await failed.settle();
    assert.match(failed.element("motor-error").textContent, /新的参考错误/);
    assert.equal(failed.element("motor-dismiss-message").hidden, false);
    failed.update({ ready: true,
        last_job: { job_id: "checked_3", action: "check", state: "completed" } });
    failed.poll();
    await failed.settle();
    assert.equal(failed.element("motor-error").hidden, true);
    assert.equal(failed.element("motor-dismiss-message").hidden, true);
    assert.equal(failed.element("right-move-top-button").disabled, false);
    checks += 1;

    const parked = harness({ ready: false, stopped: true,
        last_job: { job_id: "parked_1", action: "jog", state: "failed", error: "已请求停车" } });
    await parked.settle();
    assert.equal(parked.element("motor-dismiss-message").hidden, false);
    parked.element("motor-dismiss-message").click();
    await parked.settle();
    assert.equal(parked.posts.length, 0);
    assert.equal(parked.reads(), 1);
    assert.equal(parked.element("motor-error").hidden, true);
    assert.equal(parked.element("motor-clear-stop").hidden, false);
    assert.equal(parked.element("right-move-top-button").disabled, true);
    assert.equal(parked.element("motor-rebuild").disabled, true);
    assert.match(parked.element("motor-status").textContent, /已停车/);
    checks += 1;
    process.stdout.write(`${checks} motor UI checks passed (mocked HTTP, no hardware).\n`);
}
main().catch(error => { console.error(error); process.exitCode = 1; });
