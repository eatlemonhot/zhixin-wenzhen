(function () {
    "use strict";

    function initialisePCBControls() {
        const previewButton = document.getElementById("probe-button");
        if (!previewButton || document.getElementById("pcb-motor-controls")) return;

        let config = null;
        let status = null;
        let statusValid = false;
        let configSequence = 0;
        let configLoading = 0;
        let dirty = false;
        let draftRevision = null;
        let saving = false;
        let previewBusy = false;
        let previewSequence = 0;
        let preview = null;
        let previewFingerprint = null;
        let actionBusy = false;
        let pendingJobId = null;
        let motorUIPending = false;
        let publishedPending = false;
        let errorMessage = "";
        let noticeMessage = "";
        let previousPositions = null;
        let previousSelection = "";
        let previousLayout = "";
        const objectIds = new WeakMap();
        let nextObjectId = 1;

        const offsets = {};
        ["left", "right"].forEach(function (probe) {
            offsets[probe] = {};
            ["x", "y"].forEach(function (axis) {
                offsets[probe][axis] = document.getElementById("probe-" + probe + "-" + axis + "-offset");
            });
        });

        const style = document.createElement("style");
        style.textContent = [
            "#pcb-motor-controls{text-align:left;margin:.4rem 0 .8rem}",
            "#pcb-motor-controls p{line-height:1.4;overflow-wrap:anywhere;white-space:pre-line}",
            "#pcb-motor-controls .pcb-actions{display:flex;flex-wrap:wrap;gap:.35rem;margin:.4rem 0}",
            "#pcb-motor-controls .pcb-actions button{flex:1;min-width:7rem;padding:.35rem}",
            "#pcb-motor-controls .pcb-probes{display:flex;gap:1rem;margin:.5rem 0}",
            "#pcb-motor-controls .pcb-error{color:#ffb3a7}",
            "#pcb-motor-controls button:disabled,#probe-button:disabled{opacity:.45;cursor:not-allowed}"
        ].join("\n");
        document.head.appendChild(style);

        const panel = document.createElement("div");
        panel.id = "pcb-motor-controls";
        previewButton.insertAdjacentElement("afterend", panel);
        const enabled = {};
        const probeChoices = document.createElement("div");
        probeChoices.className = "pcb-probes";
        ["left", "right"].forEach(function (probe) {
            const label = document.createElement("label");
            const checkbox = document.createElement("input");
            checkbox.type = "checkbox";
            checkbox.id = "pcb-use-" + probe;
            checkbox.checked = true;
            label.append(checkbox, document.createTextNode(probe === "left" ? "移动左探针" : "移动右探针"));
            probeChoices.appendChild(label);
            enabled[probe] = checkbox;
        });
        panel.appendChild(probeChoices);

        function paragraph(id, className) {
            const element = document.createElement("p");
            element.id = id;
            if (className) element.className = className;
            panel.appendChild(element);
            return element;
        }
        const selectionLine = paragraph("pcb-selected-pads");
        const instruction = paragraph("pcb-motion-instructions");
        instruction.textContent = "选焊盘后先预览，再点击移动；已勾选探针的XY轴同步启动，间距不足时分组让位；不下探。";
        const configLine = paragraph("pcb-alignment-status");
        const targetsLine = paragraph("pcb-target-preview");
        targetsLine.setAttribute("role", "status");
        targetsLine.setAttribute("aria-live", "polite");
        const actions = document.createElement("div");
        actions.className = "pcb-actions";
        panel.appendChild(actions);
        function button(id, text) {
            const element = document.createElement("button");
            element.id = id;
            element.type = "button";
            element.className = "clickable";
            element.textContent = text;
            element.addEventListener("keydown", function (event) {
                if (event.repeat && (event.key === "Enter" || event.key === " ")) event.preventDefault();
            });
            actions.appendChild(element);
            return element;
        }
        const moveButton = button("pcb-move-preview", "移动到预览位置");
        const saveButton = button("pcb-save-offsets", "保存 XY 补偿");
        const teachButtons = {
            left: button("pcb-teach-left", "记录左针对准所选焊盘"),
            right: button("pcb-teach-right", "记录右针对准所选焊盘")
        };
        const teachingNote = paragraph("pcb-teach-instructions");
        teachingNote.textContent = "安装标定：先选择焊盘，用左侧点动把对应探针对准实物，再记录对准。每个探针各记录一次；换 PCB 或方向后重新标定。记录只读取当前位置，不发运动。";
        const offsetNote = paragraph("pcb-offset-instructions");
        offsetNote.textContent = "上方四项为机械 XY 补偿（mm），在板方向与安装变换后应用；修改后需保存。";
        const noticeLine = paragraph("pcb-control-notice");
        const errorLine = paragraph("pcb-control-error", "pcb-error");
        errorLine.setAttribute("role", "alert");

        function objectId(value) {
            if (!value || typeof value !== "object") return "none";
            if (!objectIds.has(value)) objectIds.set(value, nextObjectId++);
            return objectIds.get(value);
        }

        function readSelection() {
            const candidates = typeof padCandidates === "undefined" ? {} : padCandidates;
            const orientation = typeof boardRotation === "undefined" ? 0 : Number(boardRotation);
            const raw = {};
            const pads = {};
            ["left", "right"].forEach(function (probe) {
                const value = candidates && candidates[probe];
                raw[probe] = value == null || value === "" ? null : String(value);
                pads[probe] = enabled[probe].checked ? raw[probe] : null;
            });
            return { raw: raw, pads: pads, orientation: orientation };
        }

        function layoutFingerprint() {
            const dimensions = typeof layoutDimensions === "undefined" ? null : layoutDimensions;
            const pads = typeof layoutPads === "undefined" ? null : layoutPads;
            return JSON.stringify([objectId(pads), dimensions]);
        }

        function selectionFingerprint() {
            const selected = readSelection();
            return JSON.stringify([selected.pads, selected.raw, selected.orientation,
                ["left", "right"].map(function (probe) {
                    return ["x", "y"].map(function (axis) {
                        return offsets[probe][axis] ? offsets[probe][axis].value : null;
                    });
                }), layoutFingerprint()]);
        }

        function invalidatePreview(message) {
            previewSequence += 1;
            preview = null;
            previewFingerprint = null;
            if (message) noticeMessage = message;
        }

        function hardwareReady() {
            return Boolean(window.probeWorkbench && window.probeWorkbench.online) && statusValid && status && status.ready === true && status.busy === false &&
                status.stopped === false && !motorUIPending && !actionBusy && pendingJobId === null;
        }

        function publishPending() {
            const value = actionBusy || pendingJobId !== null;
            if (value === publishedPending) return;
            publishedPending = value;
            window.pcbMotorPending = value;
            window.dispatchEvent(new CustomEvent("pcb-motor-pending", { detail: { pending: value } }));
        }

        function numberText(value) {
            return typeof value === "number" && Number.isFinite(value) ? value.toFixed(3) : "未知";
        }

        function errorText(value) {
            if (typeof value === "string") return value;
            return value && value.message ? String(value.message) : JSON.stringify(value);
        }

        window.addEventListener("execution-mode-changed", function () { invalidatePreview(); render(); });
        function render() {
            publishPending();
            const selected = readSelection();
            const hasTarget = Boolean(selected.pads.left || selected.pads.right);
            const loaded = Boolean(config && config.layout_id);
            const working = actionBusy || pendingJobId !== null;
            previewButton.disabled = !loaded || !hasTarget || dirty || saving || previewBusy ||
                configLoading > 0 || working;
            moveButton.disabled = !preview || preview.can_move !== true || !hardwareReady() ||
                dirty || saving || previewBusy || configLoading > 0 ||
                previewFingerprint !== selectionFingerprint();
            saveButton.disabled = !config || !dirty || saving || working || configLoading > 0;
            ["left", "right"].forEach(function (probe) {
                teachButtons[probe].disabled = !loaded || !selected.raw[probe] || !hardwareReady() ||
                    dirty || saving || previewBusy || configLoading > 0;
            });

            selectionLine.textContent = ["left", "right"].map(function (probe) {
                const name = probe === "left" ? "左针" : "右针";
                if (!selected.raw[probe]) return name + "：未选焊盘";
                const pads = typeof layoutPads === "undefined" ? {} : layoutPads;
                const pad = pads && pads[selected.raw[probe]];
                const net = pad && pad.net ? String(pad.net) : selected.raw[probe];
                return name + "：" + net + (enabled[probe].checked ? "" : "（本次不移动）");
            }).join("\n");

            if (!config) {
                configLine.textContent = "正在读取 PCB 安装配置。";
            } else if (!loaded) {
                configLine.textContent = "请先上传 PCB 文件，再选择测点。";
            } else {
                const alignment = config.alignment || {};
                configLine.textContent = "安装标定：左针" + (alignment.left ? "已记录" : "未记录") +
                    "，右针" + (alignment.right ? "已记录" : "未记录") + "。";
                if (config.message) configLine.textContent += " " + String(config.message);
            }

            const lines = [];
            if (preview) {
                ["left", "right"].forEach(function (probe) {
                    const point = preview.points && preview.points[probe];
                    if (!point) return;
                    lines.push((probe === "left" ? "左针" : "右针") + "板坐标：X " +
                        numberText(point.x) + "，Y " + numberText(point.y) + " mm" +
                        (point.net ? "；网络 " + String(point.net) : ""));
                });
                const axisNames = { "1": "左 X", "2": "右 X", "3": "左 Y", "4": "右 Y" };
                const targets = preview.targets;
                if (targets && typeof targets === "object") {
                    Object.entries(targets).forEach(function (entry) {
                        lines.push("电机目标 " + (axisNames[entry[0]] || entry[0]) + "：" + numberText(entry[1]) + " mm");
                    });
                }
                (Array.isArray(preview.errors) ? preview.errors : []).forEach(function (error) {
                    lines.push(errorText(error));
                });
                if (!preview.can_move) lines.push("当前预览不能移动，请先完成对应探针标定并检查电机。");
                else if (!hardwareReady()) lines.push("预览已生成；电机检查通过且空闲后才可移动。");
            } else {
                lines.push("尚无有效预览。");
            }
            targetsLine.textContent = lines.join("\n");
            noticeLine.textContent = dirty ? "XY 补偿已修改，请先保存，再预览或记录对准。" :
                (working ? "电机任务处理中；请等待，停车仍可使用。" : noticeMessage);
            errorLine.textContent = errorMessage;
            errorLine.hidden = !errorMessage;
        }

        async function requestJSON(path, payload) {
            const controller = new AbortController();
            const timeout = window.setTimeout(function () { controller.abort(); }, 10000);
            const options = { credentials: "same-origin", cache: "no-store", signal: controller.signal };
            if (payload !== undefined) {
                options.method = "POST";
                options.headers = { "Content-Type": "application/json", "X-Requested-With": "XMLHttpRequest" };
                options.body = JSON.stringify(payload);
            }
            try {
                const response = await fetch(path, options);
                let data;
                try { data = await response.json(); }
                catch (_error) { throw new Error("服务返回的数据无效，请检查悟净上的 PCB 控制服务。"); }
                if (!response.ok) throw new Error(data.error || "请求失败（HTTP " + response.status + "）。");
                return { data: data, code: response.status };
            } catch (error) {
                if (error.name === "AbortError") throw new Error("请求超时，请检查连接；运动不会自动重试。");
                if (error instanceof TypeError) throw new Error("无法连接悟净，请检查网络连接。");
                throw error;
            } finally {
                window.clearTimeout(timeout);
            }
        }

        async function refreshConfig() {
            const sequence = ++configSequence;
            configLoading += 1;
            render();
            try {
                const result = await requestJSON("/motor/pcb/config");
                if (sequence !== configSequence) return;
                const next = result.data;
                if (!next || typeof next !== "object" || !next.offsets) throw new Error("PCB 安装配置无效。");
                if (config && (config.revision !== next.revision || config.layout_id !== next.layout_id ||
                    config.orientation !== next.orientation)) invalidatePreview("安装配置已更新，请重新预览。");
                config = next;
                if (!dirty) {
                    ["left", "right"].forEach(function (probe) {
                        ["x", "y"].forEach(function (axis) {
                            const input = offsets[probe][axis];
                            const value = next.offsets[probe] && next.offsets[probe][axis];
                            if (input) input.value = Number.isFinite(Number(value)) ? String(value) : "0";
                        });
                    });
                    draftRevision = next.revision;
                }
                previousSelection = selectionFingerprint();
            } catch (error) {
                if (sequence === configSequence) errorMessage = "读取安装配置失败：" + error.message;
            } finally {
                configLoading -= 1;
                render();
            }
        }

        window.motorStatus.subscribe(function (next, error) {
            if (error) {
                statusValid = false;
                errorMessage = "读取电机状态失败：" + error.message;
                render();
                return;
            }
            status = next;
            statusValid = true;
            if (errorMessage.startsWith("读取电机状态失败：")) errorMessage = "";
            const positions = JSON.stringify(next.positions_mm || null);
            if (previousPositions !== null && positions !== previousPositions && preview) {
                invalidatePreview("电机位置已改变，请重新预览。");
            }
            previousPositions = positions;
            const job = next.last_job;
            const jobId = job && (job.job_id == null ? job.id : job.job_id);
            if (pendingJobId !== null && next.busy === false &&
                ((jobId != null && String(jobId) === pendingJobId) || next.stopped)) {
                pendingJobId = null;
                if (job && job.error) errorMessage = "电机任务失败：" + String(job.error);
                else noticeMessage = next.stopped ? "已停车，请重新检查电机。" : "任务已完成，请重新预览测点。";
                invalidatePreview();
                void refreshConfig();
            }
            render();
        });
        function refreshStatus() { return window.motorStatus.refresh(); }

        async function makePreview() {
            if (previewButton.disabled || previewBusy) return;
            const selected = readSelection();
            const fingerprint = selectionFingerprint();
            invalidatePreview();
            const sequence = previewSequence;
            previewBusy = true;
            errorMessage = "";
            noticeMessage = "正在计算测点位置，不会移动电机。";
            render();
            try {
                const result = await requestJSON("/motor/pcb/preview", {
                    pads: selected.pads, orientation: selected.orientation
                });
                if (sequence !== previewSequence || fingerprint !== selectionFingerprint()) return;
                preview = result.data;
                previewFingerprint = fingerprint;
                noticeMessage = preview.can_move ? "预览通过，请核对目标后点击移动。" : "已显示板坐标；当前不满足实机定位条件，请按提示完成标定和电机检查。";
            } catch (error) {
                if (sequence === previewSequence) errorMessage = "预览失败：" + error.message;
            } finally {
                previewBusy = false;
                render();
            }
        }

        async function performHardwareAction(path, payload, name) {
            if (!hardwareReady()) return;
            window.motorStatus.invalidate();
            actionBusy = true;
            errorMessage = "";
            invalidatePreview();
            render();
            try {
                const result = await requestJSON(path, payload);
                if (result.code !== 202 || result.data.job_id == null) {
                    throw new Error("未收到有效任务编号，请检查状态并重新预览。");
                }
                pendingJobId = String(result.data.job_id);
                noticeMessage = name + "已提交，请等待任务完成。";
            } catch (error) {
                statusValid = false;
                errorMessage = name + "失败：" + error.message;
            } finally {
                actionBusy = false;
                render();
                window.motorStatus.invalidate();
                await refreshStatus();
            }
        }

        async function saveOffsets() {
            if (saveButton.disabled) return;
            const values = {};
            for (const probe of ["left", "right"]) {
                values[probe] = {};
                for (const axis of ["x", "y"]) {
                    const input = offsets[probe][axis];
                    const value = input ? Number(input.value) : NaN;
                    if (!input || input.value.trim() === "" || !Number.isFinite(value) || !input.checkValidity()) {
                        errorMessage = "请填写有效的 XY 补偿值，并遵守输入框的数值范围。";
                        render();
                        return;
                    }
                    values[probe][axis] = value;
                }
            }
            saving = true;
            errorMessage = "";
            invalidatePreview();
            render();
            try {
                await requestJSON("/motor/pcb/config", { offsets: values, revision: draftRevision });
                dirty = false;
                noticeMessage = "XY 补偿已保存，未发送运动命令。请重新预览。";
                await refreshConfig();
            } catch (error) {
                errorMessage = "保存 XY 补偿失败：" + error.message;
            } finally {
                saving = false;
                render();
            }
        }

        function checkForChanges(forceLayout) {
            const selection = selectionFingerprint();
            const layout = layoutFingerprint();
            if (selection !== previousSelection || forceLayout) {
                const oldOrientation = config && config.orientation;
                invalidatePreview("测点、方向或补偿已改变，请重新预览。");
                previousSelection = selection;
                if (forceLayout || layout !== previousLayout ||
                    (oldOrientation != null && Number(oldOrientation) !== readSelection().orientation)) {
                    void refreshConfig();
                }
                render();
            }
            previousLayout = layout;
        }

        previewButton.type = "button";
        previewButton.textContent = "预览测点";
        previewButton.onclick = function (event) {
            if (event) event.preventDefault();
            void makePreview();
        };
        window.sendProbeCommand = function () { void makePreview(); };
        moveButton.addEventListener("click", function () {
            if (moveButton.disabled || !preview) return;
            const id = preview.preview_id;
            void performHardwareAction("/motor/pcb/move", { preview_id: id }, "移动到测点");
        });
        saveButton.addEventListener("click", function () { void saveOffsets(); });
        ["left", "right"].forEach(function (probe) {
            enabled[probe].addEventListener("change", function () { checkForChanges(false); });
            teachButtons[probe].addEventListener("click", function () {
                if (teachButtons[probe].disabled) return;
                const selected = readSelection();
                void performHardwareAction("/motor/pcb/teach", {
                    probe: probe, pad_id: selected.raw[probe], orientation: selected.orientation,
                    revision: config.revision
                }, "记录探针对准");
            });
            ["x", "y"].forEach(function (axis) {
                const input = offsets[probe][axis];
                if (!input) return;
                input.removeAttribute("onchange");
                input.onchange = null;
                input.addEventListener("input", function () {
                    dirty = true;
                    invalidatePreview("XY 补偿已改变，请先保存。");
                    previousSelection = selectionFingerprint();
                    render();
                });
            });
        });
        document.querySelectorAll("input[type='file']").forEach(function (input) {
            input.addEventListener("change", function () {
                invalidatePreview("电路文件已改变，请完成上传后重新预览。");
                render();
            });
        });
        window.addEventListener("motor-ui-pending", function (event) {
            motorUIPending = Boolean(event.detail && event.detail.pending);
            if (motorUIPending && preview) invalidatePreview("电机状态正在更新，请重新预览。");
            render();
        });
        window.addEventListener("pcb-selection-changed", function () { checkForChanges(false); });
        window.addEventListener("pcb-layout-changed", function () { checkForChanges(true); });

        previousSelection = selectionFingerprint();
        previousLayout = layoutFingerprint();
        render();
        void refreshConfig();
        void refreshStatus();
        window.setInterval(function () { checkForChanges(false); }, 500);
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", initialisePCBControls, { once: true });
    } else {
        initialisePCBControls();
    }
}());
