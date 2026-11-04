/* XY jogging, coordinate rebuilding and circle tests through the motor service. */
(function () {
    "use strict";

    function initialiseMotorControls() {
        const section = document.getElementById("control-section");
        if (!section || document.getElementById("motor-controls")) return;

        const directionNames = {
            top: { command: "up", label: "上" },
            bottom: { command: "down", label: "下" },
            left: { command: "left", label: "左" },
            right: { command: "right", label: "右" }
        };
        const motorAddresses = { left: { x: 1, y: 3 }, right: { x: 2, y: 4 } };
        const directions = [];
        let status = null;
        let statusAvailable = false;
        let mutationCount = 0;
        let stopPending = false;
        let pendingJobId = null;
        let pendingAction = null;
        let requestError = "";
        let requestNotice = "";
        let observedJobId = null;
        let actionSequence = 0;
        let externalPending = false;
        let publishedPending = false;

        const style = document.createElement("style");
        style.textContent = [
            "#control-section #motor-controls{display:block;margin:.5rem 0 .7rem;text-align:left}",
            "#control-section #motor-controls .motor-actions{display:flex;flex-wrap:wrap;gap:.35rem;margin:.4rem 0}",
            "#motor-controls .motor-actions button{width:auto;flex:1;margin:0;white-space:nowrap}",
            "#motor-controls #motor-step{width:auto;margin:0 0 .25rem .3rem}",
            "#motor-controls button,#motor-step{padding:.3rem .45rem}",
            "#motor-controls p{line-height:1.4;overflow-wrap:anywhere}",
            "#motor-controls .motor-error{color:#ffb3a7}",
            "#motor-controls .motor-stop{background:#8d2626;border-color:#ffb3a7}",
            "#control-section button:disabled{opacity:.45;cursor:not-allowed}"
        ].join("\n");
        document.head.appendChild(style);

        const controls = document.createElement("div");
        controls.id = "motor-controls";

        const stepLabel = document.createElement("label");
        stepLabel.htmlFor = "motor-step";
        stepLabel.textContent = "点动步长：";
        const stepSelect = document.createElement("select");
        stepSelect.id = "motor-step";
        stepSelect.className = "clickable";
        [1/90, 5/90, 0.1, 0.5, 1, 10].forEach(function (value) {
            const option = document.createElement("option");
            option.value = String(value);
            option.textContent = value === 10 ? "1 cm（10 mm）" : value === 1/90 ? "≈0.0111 mm（1单位）" : value === 5/90 ? "≈0.0556 mm（5单位）" : value + " mm";
            option.selected = value === 1;
            stepSelect.appendChild(option);
        });
        controls.append(stepLabel, stepSelect);

        const taskActions = document.createElement("div");
        taskActions.className = "motor-actions";
        const actions = document.createElement("div");
        actions.className = "motor-actions";
        function createButton(id, label, extraClass, parent) {
            const button = document.createElement("button");
            button.id = id;
            button.type = "button";
            button.className = "clickable" + (extraClass ? " " + extraClass : "");
            button.textContent = label;
            (parent || actions).appendChild(button);
            return button;
        }
        const rebuildButton = createButton("motor-rebuild", "坐标重建", "", taskActions);
        rebuildButton.title = "自动抬起双针、回读并等待600 ms，再四轴同时找边；无需逐次确认抬针";
        const circleButton = createButton("motor-circle", "移动测试（画圆）", "", taskActions);
        circleButton.title = "自动核验抬针，以最高300 rpm、900 rpm/s同步移到起点，再按已有坐标画圆，不重复找边";
        const checkButton = createButton("motor-check", "检查电机");
        const stopButton = createButton("motor-stop", "停车", "motor-stop");
        stopButton.title = "请求当前控制器停车，并锁定后续点动";
        const clearStopButton = createButton("motor-clear-stop", "解除停车");
        clearStopButton.hidden = true;
        const dismissButton = createButton("motor-dismiss-message", "关闭提示");
        dismissButton.title = "仅关闭当前提示，不改变停车或坐标状态";
        dismissButton.hidden = true;
        controls.append(taskActions, actions);

        const statusLine = document.createElement("p");
        statusLine.id = "motor-status";
        statusLine.setAttribute("role", "status");
        statusLine.setAttribute("aria-live", "polite");
        const positionLine = document.createElement("p");
        positionLine.id = "motor-positions";
        const errorLine = document.createElement("p");
        errorLine.id = "motor-error";
        errorLine.className = "motor-error";
        errorLine.setAttribute("role", "alert");
        const noticeLine = document.createElement("p");
        noticeLine.id = "motor-notice";
        noticeLine.setAttribute("role", "status");
        const note = document.createElement("p");
        note.textContent = "点动／定位／重建／画圆均自动核验抬针；新抬针等待600 ms，已核验并等待过的UP直接复用。焊盘定位和画圆起步：最高300 rpm、900 rpm/s，同针XY同步；双臂间距不足时整臂分先后。点动保留低速便于标定。双针使用各自已保存的PWM端点，详见舵机状态。无到位传感器。左右以站在设备前方为准；左X 1、右X 2、左Y 3、右Y 4；上为向后，下为向前。";
        controls.append(statusLine, positionLine, errorLine, noticeLine, note);

        const heading = section.querySelector("h2");
        if (heading) {
            heading.textContent = "探针控制";
            heading.insertAdjacentElement("afterend", controls);
        } else {
            section.prepend(controls);
        }

        function canStartTask() {
            return Boolean(window.probeWorkbench?.online) && statusAvailable && status && status.available === true &&
                status.busy === false && status.stopped === false &&
                mutationCount === 0 && pendingJobId === null && !externalPending;
        }

        function canJog() {
            return canStartTask() && status.ready === true;
        }

        function formatPositions(positions) {
            if (!positions || typeof positions !== "object") return "";
            const labels = { left: "左探针", right: "右探针", x: "X", y: "Y",
                "1": "左X内移（1号）", "2": "右X内移（2号）", "3": "左Y（3号）", "4": "右Y（4号）" };
            function formatValue(value) {
                if (typeof value === "number" && Number.isFinite(value)) return value.toFixed(3);
                if (value && typeof value === "object") {
                    return Object.entries(value).map(function (entry) {
                        return (labels[entry[0]] || entry[0]) + ": " + formatValue(entry[1]);
                    }).join("，");
                }
                return value == null ? "未知" : String(value);
            }
            return "位置（mm）：" + formatValue(positions);
        }

        window.addEventListener("execution-mode-changed", function () { render(); });
        function render() {
            const ownPending = mutationCount > 0 || pendingJobId !== null;
            if (ownPending !== publishedPending) {
                publishedPending = ownPending;
                window.dispatchEvent(new CustomEvent("motor-ui-pending", { detail: { pending: ownPending } }));
            }
            const online = Boolean(window.probeWorkbench && window.probeWorkbench.online);
            const ready = online && canJog();
            const currentAction = pendingAction || (status && status.busy && status.last_job && status.last_job.action);
            directions.forEach(function (button) { button.disabled = !ready; });
            stepSelect.disabled = !ready;
            rebuildButton.disabled = !online || !canStartTask();
            circleButton.disabled = !ready;
            rebuildButton.textContent = currentAction === "rebuild" ? "正在重建…" : "坐标重建";
            circleButton.textContent = currentAction === "circle" ? "正在测试…" : "移动测试（画圆）";
            checkButton.disabled = !online || mutationCount > 0 || pendingJobId !== null || externalPending || Boolean(status && status.busy);
            stopButton.disabled = stopPending;
            clearStopButton.hidden = !(status && status.stopped);
            clearStopButton.disabled = !online || !statusAvailable || mutationCount > 0 ||
                pendingJobId !== null || externalPending || Boolean(status && status.busy);
            dismissButton.hidden = !requestError && !requestNotice;

            let summary;
            if (!online) {
                summary = "离线规划中：电机操作已关闭，可导入、选点和预览。";
            } else if (!statusAvailable) {
                summary = "电机状态暂不可用，方向控制已禁用。";
            } else if (!status.available) {
                summary = "未找到悟净电机控制程序。";
            } else if (status.stopped) {
                summary = "已停车，解除停车后需重新检查电机。";
            } else if (status.busy || mutationCount > 0 || pendingJobId !== null || externalPending) {
                const descriptions = {
                    rebuild: "坐标重建进行中（自动抬针、找边、退让、校验），请等待。",
                    circle: "移动测试进行中（自动抬针、画圆、返回），请等待。",
                    jog: "正在准备并执行一次点动，请等待。",
                    check: "正在读取四轴状态，请等待。"
                };
                summary = descriptions[currentAction] || "电机任务处理中，请等待。";
            } else if (ready) {
                summary = "电机已就绪，可单击点动或运行画圆测试。";
            } else {
                summary = status.initialization?.message || "尚未就绪，请检查电机或手动重建。";
            }
            const limitNotice = status && status.last_job && status.last_job.state === "limited" && status.last_job.notice;
            if (statusAvailable && status.message && String(status.message) !== String(limitNotice || "")) {
                summary += " " + String(status.message);
            }
            statusLine.textContent = summary;
            positionLine.textContent = statusAvailable ? formatPositions(status.positions_mm) : "";
            errorLine.textContent = requestError + (requestError && statusAvailable && !status.ready && !status.stopped ?
                " 可先点击“检查电机”确认坐标；检查通过即可继续。" : "");
            errorLine.hidden = !requestError;
            noticeLine.textContent = requestNotice;
            noticeLine.hidden = !requestNotice;
        }

        async function requestJSON(path, options) {
            const controller = new AbortController();
            const timeout = window.setTimeout(function () { controller.abort(); }, 10000);
            try {
                const response = await fetch(path, Object.assign({
                    credentials: "same-origin",
                    cache: "no-store",
                    signal: controller.signal
                }, options));
                let data;
                try {
                    data = await response.json();
                } catch (_error) {
                    throw new Error("服务返回的数据无效，请检查悟净上的电机服务。");
                }
                if (!response.ok) throw new Error(data.error || "电机请求失败（HTTP " + response.status + "）。");
                return { data: data, code: response.status };
            } catch (error) {
                if (error.name === "AbortError") {
                    throw new Error("请求超时，运动结果未知；请检查连接并使用停车。");
                }
                if (error instanceof TypeError) throw new Error("无法连接电机服务，请检查悟净网络连接。");
                throw error;
            } finally {
                window.clearTimeout(timeout);
            }
        }

        function applyStatus(data) {
            if (!data || typeof data !== "object" || typeof data.ready !== "boolean" ||
                typeof data.busy !== "boolean" || typeof data.stopped !== "boolean") {
                throw new Error("电机状态数据无效，方向控制已禁用。");
            }
            status = data;
            statusAvailable = true;
            const job = data.last_job;
            const jobId = job && (job.job_id == null ? job.id : job.job_id);
            if (pendingJobId !== null && jobId != null &&
                String(jobId) === pendingJobId && data.busy === false) {
                pendingJobId = null;
                pendingAction = null;
            }
            if (jobId != null && String(jobId) !== observedJobId && data.busy === false) {
                observedJobId = String(jobId);
                if (job.error) {
                    requestError = "电机任务失败：" + String(job.error);
                    requestNotice = "";
                } else if (job.state === "limited") {
                    requestError = "";
                    requestNotice = String(job.notice || data.message || "已到达软限位，请向相反方向移动。");
                } else if (job.state === "completed") {
                    requestError = "";
                    requestNotice = "";
                }
            }
        }

        window.motorStatus.subscribe(function (data, error) {
            try {
                if (error) throw error;
                applyStatus(data);
            } catch (failure) {
                statusAvailable = false;
                requestError = failure.message;
            }
            render();
        });
        function refreshStatus() { return window.motorStatus.refresh(); }

        async function performAction(path, payload, actionName) {
            const isStop = path === "/motor/stop";
            if (isStop && stopPending) return;
            if (!isStop && (mutationCount > 0 || pendingJobId !== null || externalPending || Boolean(status && status.busy))) return;
            const actionId = ++actionSequence;
            window.motorStatus.invalidate();
            mutationCount += 1;
            if (isStop) stopPending = true;
            pendingAction = path.substring(path.lastIndexOf("/") + 1);
            requestError = "";
            requestNotice = "";
            render();
            try {
                const result = await requestJSON(path, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "X-Requested-With": "XMLHttpRequest"
                    },
                    body: JSON.stringify(payload || {})
                });
                if (result.code === 202) {
                    if (result.data.job_id == null) {
                        throw new Error("任务已提交但未收到任务编号，请先停车并检查电机状态。");
                    }
                    if (actionId === actionSequence) pendingJobId = String(result.data.job_id);
                } else if (actionId === actionSequence) {
                    pendingJobId = null;
                    pendingAction = null;
                }
            } catch (error) {
                statusAvailable = false;
                if (actionId === actionSequence) pendingAction = null;
                requestError = actionName + "失败：" + error.message;
            } finally {
                mutationCount -= 1;
                if (isStop) stopPending = false;
                render();
                window.motorStatus.invalidate();
                await refreshStatus();
            }
        }

        ["left", "right"].forEach(function (probe) {
            Object.entries(directionNames).forEach(function (entry) {
                const button = document.getElementById(probe + "-move-" + entry[0] + "-button");
                if (!button) return;
                const direction = entry[1];
                button.type = "button";
                button.textContent = direction.label;
                const axis = ["up", "down"].includes(direction.command) ? "y" : "x";
                button.title = (probe === "left" ? "左臂" : "右臂") + "（" + axis.toUpperCase() + "：" +
                    motorAddresses[probe][axis] + "号）向" + direction.label + "点动";
                button.disabled = true;
                button.addEventListener("keydown", function (event) {
                    if (event.repeat && (event.key === "Enter" || event.key === " ")) event.preventDefault();
                });
                button.addEventListener("click", function (event) {
                    event.preventDefault();
                    if (!canJog()) return;
                    const step = Number(stepSelect.value);
                    if (![1/90, 5/90, 0.1, 0.5, 1, 10].includes(step)) return;
                    void performAction("/motor/jog", {
                        probe: probe,
                        direction: direction.command,
                        step_mm: step
                    }, "点动");
                });
                directions.push(button);
            });
            const probeButton = document.getElementById(probe + "-move-probe-button");
            if (probeButton) {
                probeButton.type = "button";
                probeButton.textContent = "下探";
                probeButton.title = "此点动面板控制XY轴";
                probeButton.disabled = true;
                probeButton.setAttribute("aria-label", "此点动面板控制XY轴");
            }
        });

        checkButton.addEventListener("click", function () {
            void performAction("/motor/check", {}, "检查电机");
        });
        rebuildButton.addEventListener("click", function () {
            if (canStartTask()) void performAction("/motor/rebuild", {}, "坐标重建");
        });
        circleButton.addEventListener("click", function () {
            if (canJog()) void performAction("/motor/circle", {}, "移动测试");
        });
        stopButton.addEventListener("click", function () {
            void performAction("/motor/stop", {}, "停车");
        });
        clearStopButton.addEventListener("click", function () {
            void performAction("/motor/clear-stop", {}, "解除停车");
        });
        dismissButton.addEventListener("click", function () {
            requestError = "";
            requestNotice = "";
            render();
        });

        window.addEventListener("pcb-motor-pending", function (event) {
            externalPending = Boolean(event.detail && event.detail.pending);
            render();
        });
        render();
        void refreshStatus();
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", initialiseMotorControls, { once: true });
    } else {
        initialiseMotorControls();
    }
}());


