"use strict";
const assert = require("node:assert/strict");
const fs = require("node:fs");
const vm = require("node:vm");
const source = fs.readFileSync(__dirname + "/../interface/static/js/motor-status.js", "utf8");
async function main() {
    let now = 10000;
    const events = new Map(), timers = [], requests = [];
    const window = {
        setTimeout: () => 1, clearTimeout() {},
        setInterval: (callback, ms) => timers.push({ callback, ms }),
        addEventListener(name, callback) { events.set(name, callback); }
    };
    const fetch = () => new Promise(resolve => requests.push(resolve));
    const ready = { ready: true, busy: false, stopped: false };
    const busy = { ready: false, busy: true, stopped: false };
    const stopped = { ready: false, busy: false, stopped: true };
    const settle = () => new Promise(resolve => setImmediate(resolve));
    const resolve = data => requests.shift()({ ok: true, json: async () => data });
    vm.runInNewContext(source, { window, fetch, AbortController, Date: { now: () => now } });
    const left = [], pcb = [];
    window.motorStatus.subscribe((data,error) => left.push({data,error}));
    window.motorStatus.subscribe((data,error) => pcb.push({data,error}));
    const first = window.motorStatus.refresh();
    assert.equal(window.motorStatus.refresh(), first);
    assert.equal(requests.length, 1);
    resolve(ready); await first;
    assert.equal(left.length, 1); assert.equal(pcb.length, 1);
    assert.equal(timers[0].ms, 150);
    now += 150; timers[0].callback();
    assert.equal(requests.length, 0);
    now += 850; timers[0].callback();
    assert.equal(requests.length, 1);
    resolve(busy); await settle();
    now += 140; timers[0].callback();
    assert.equal(requests.length, 1);
    resolve(busy); await settle();
    window.motorStatus.invalidate();
    const pending = window.motorStatus.refresh();
    window.motorStatus.invalidate();
    resolve(ready); await settle();
    assert.equal(requests.length, 1);
    assert.equal(left.at(-1).data.ready, false);
    resolve(stopped); await pending;
    assert.equal(left.at(-1).data.stopped, true);
    assert.equal(pcb.at(-1).data.stopped, true);
    const invalid = window.motorStatus.refresh();
    resolve({ready:true}); await invalid;
    assert.ok(left.at(-1).error); assert.ok(pcb.at(-1).error);
    assert.equal(left.at(-1).data, null);
    console.log("6 shared motor status checks passed (mocked HTTP).");
}
main().catch(error => { console.error(error); process.exitCode = 1; });
