(function () {
    "use strict";
    const listeners = new Set();
    const pending = { motor: false, pcb: false };
    let status = null;
    let request = null;
    let generation = 0;
    let lastRead = 0;
    let lastError = null;

    function publish(data, error) {
        status = data;
        lastError = error;
        listeners.forEach(function (listener) { listener(data, error); });
    }
    async function read() {
        const controller = new AbortController();
        const timeout = window.setTimeout(function () { controller.abort(); }, 10000);
        try {
            const response = await fetch("/motor/status", {
                credentials: "same-origin", cache: "no-store", signal: controller.signal
            });
            const data = await response.json();
            if (!response.ok || !data || typeof data.ready !== "boolean" ||
                typeof data.busy !== "boolean" || typeof data.stopped !== "boolean") {
                throw new Error("电机状态数据无效，控制已禁用。");
            }
            return data;
        } catch (error) {
            throw new Error(error.name === "AbortError" ? "读取电机状态超时，请检查连接。" : error.message);
        } finally {
            window.clearTimeout(timeout);
        }
    }
    function refresh() {
        if (request) return request;
        request = (async function () {
            let stamp;
            do {
                stamp = generation;
                try {
                    const data = await read();
                    if (stamp === generation) publish(data, null);
                } catch (error) {
                    if (stamp === generation) publish(null, error);
                }
            } while (stamp !== generation);
            lastRead = Date.now();
        }()).finally(function () { request = null; });
        return request;
    }
    function track(name, key) {
        window.addEventListener(name, function (event) {
            const value = Boolean(event.detail && event.detail.pending);
            if (value !== pending[key]) generation += 1;
            pending[key] = value;
        });
    }
    track("motor-ui-pending", "motor");
    track("pcb-motor-pending", "pcb");
    window.motorStatus = {
        invalidate: function () { generation += 1; },
        refresh: refresh,
        subscribe: function (listener) {
            listeners.add(listener);
            if (status || lastError) listener(status, lastError);
            return function () { listeners.delete(listener); };
        }
    };
    window.setInterval(function () {
        const busy = pending.motor || pending.pcb || (status && status.busy);
        if (busy || Date.now()-lastRead >= 1000) void refresh();
    }, 150);
}());
