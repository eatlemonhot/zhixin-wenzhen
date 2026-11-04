function subFile(obj, filename) {
    var file = obj.value;
    var fileName = file.split("\\");
    document.getElementById(filename + "-file-button").textContent = fileName[fileName.length - 1];
}

function untoggle(position){
    let toggle = document.getElementById("net-selection-" + position + "-mouse-select");
    if (toggle.checked) {
        toggle.checked = false;
    }
}

function untoggleCandidate(position){
    let toggle = document.getElementById("candidates-selection-" + position + "-mouse-select");
    if (toggle.checked) {
        toggle.checked = false;
    }
}

let layoutEdges = [];
let layoutPads = [];
let layoutDimensions = [];
let padCandidates = {
    "left": "",
    "right": ""
};
let boardRotation = 0;
let pcbDisplayMode = "2D";
let availableNets = [];


let Context2D = new p5(p => {
    let parent = document.getElementById("main-pcb-2D-section");
    let scale = 10;
    let downPressX = 0;
    let downPressY = 0;
    let centerX = 0;
    let centerY = 0;
    let downPress = false;

    p.setup = () => {
        p.width = parent.offsetWidth;
        p.height = parent.offsetHeight;
        p.canvas = p.createCanvas(p.width, p.height);
        p.canvas.parent(parent.id);

        centerX = p.width / 2 + 200;
        centerY = p.height / 2 + 100;

        p.angleMode(p.DEGREES);
        p.rectMode(p.CENTER);

        setTimeout(() => {
            p.windowResized();
        }, 200);
    }

    p.windowResized = () => {
        p.width = parent.offsetWidth;
        p.height = parent.offsetHeight;
        p.resizeCanvas(p.width, p.height);
    }

    p.fitBoard = () => {
        const width = parent.offsetWidth, height = parent.offsetHeight;
        if (!width || !height || !layoutDimensions.width || !layoutDimensions.height) return;
        p.width = width;
        p.height = height;
        p.resizeCanvas(width, height);
        const rotated = boardRotation === 90 || boardRotation === 270;
        const boardWidth = rotated ? layoutDimensions.height : layoutDimensions.width;
        const boardHeight = rotated ? layoutDimensions.width : layoutDimensions.height;
        scale = Math.min((width - 30) / boardWidth, (height - 30) / boardHeight, 20);
        centerX = width - boardWidth * scale / 2;
        centerY = height - boardHeight * scale / 2;
    };

    p.hide = () => {
        p.canvas.hide();
    }

    p.show = () => {
        p.canvas.show();
    }

    p.draw = () => {
        if (parent.hidden) return;
        p.background(50);

        p.translate(centerX - p.width/2, centerY - p.height/2);
        p.scale(scale);

        p.stroke(255, 100, 0);
        p.strokeWeight(0.8);
        p.noFill();

        p.circle(0, 0, 2);
        p.line(1, 0, 10, 0);
        p.line(0, 1, 0, 10);


        p.stroke(255);
        p.strokeWeight(0.1);
        p.fill(0);

        if (boardRotation == 90) {
            p.rotate(90);
            p.translate(0, -layoutDimensions.height);
        } else if (boardRotation == 180) {
            p.rotate(180);
            p.translate(-layoutDimensions.width, -layoutDimensions.height);
        } else if (boardRotation == 270) {
            p.rotate(270);
            p.translate(-layoutDimensions.width, 0);
        }

        p.beginShape();

        for (let i = 0; i < layoutEdges.length; i++) {
            let x = layoutEdges[i]["start"]["x"];
            let y = layoutEdges[i]["start"]["y"];

            p.vertex(x, y, 0);
        }
        p.endShape(p.CLOSE);

        for (const item of window.probeWorkbench?.design?.graphics || []) {
            if (item.kind === 'line' && item.layer === 1) {
                p.stroke(40,110,91); p.strokeWeight(item.width);
                p.line(...item.points[0], ...item.points[1]);
            }
        }

        let selector1 = document.getElementById("net-selection-first-select")
        let selector2 = document.getElementById("net-selection-second-select")

        for (const [i, pad] of Object.entries(layoutPads)) {
            let id = pad["id"];
            let footprintAngle = pad["footprint_angle"];
            let footprintX = pad["footprint_x"];
            let footprintY = pad["footprint_y"];
            let padX = pad["pad_x"];
            let padY = pad["pad_y"];
            let net = pad["net"];
            let padAngle = pad["pad_angle"];
            let sizeX = pad["size_x"];
            let sizeY = pad["size_y"];
            let shape = pad["shape"];
            let roundrectRatio = pad["roundrect_ratio"];
            let isAllowed = pad["is_allowed"];
            let tags = pad["tags"];
            let relativeAngle = pad["relative_angle"];


            p.push();
            p.translate(footprintX, footprintY);
            p.rotate(-1*footprintAngle);
            p.fill(255);
            p.translate(padX, padY);

            if (selector1.value == net || "/" + selector1.value == net) {
                p.stroke(255, 0, 0);
                p.fill(255, 0, 0);
            } else if (selector2.value == net || "/" + selector2.value == net) {
                p.stroke(0, 0, 255);
                p.fill(0, 0, 255);
            } else {
                p.stroke(255);
                p.fill(255);
            }

            if (pad.reference && pad.reference === window.probeWorkbench?.component) {
                p.stroke(72, 215, 232); p.fill(72, 215, 232);
            }
            let isCandidate = false;

            if (padCandidates["left"] == id) {
                p.stroke(100, 200, 0);
                p.strokeWeight(0.3);
                isCandidate = true;
            } else if (padCandidates["right"] == id) {
                p.stroke(100, 200, 0);
                p.strokeWeight(0.3);
                isCandidate = true;
            }

            if (!isAllowed) {
                p.stroke(200, 0, 100);
                p.fill(200, 0, 100);
            }

            if (shape == "circle") {
                p.circle(0, 0, sizeX);
            } else if (shape == "rect") {
                p.rect(0, 0, sizeX, sizeY);
            } else if (shape == "roundrect") {
                p.rect(0, 0, sizeX, sizeY, sizeX * roundrectRatio);
            } else if (shape == "oval") {
                p.ellipse(0, 0, sizeX, sizeY);
            } else {
                p.fill(0, 255, 0);
                p.stroke(0, 255, 0);
                p.rect(0, 0, 1, 1);
                console.log("Unknown pad shape: " + shape);
            }

            if (isCandidate) {
                let x2 = Math.cos(relativeAngle) * sizeX / 3;
                let y2 = Math.sin(relativeAngle) * sizeY / 3;

                p.point(x2, y2);
            }
            p.pop();
        }
    }

    p.keyPressed = () => {
        if (document.activeElement && document.activeElement.matches("input, textarea, select, [contenteditable='true']")) return;
        let netCheckBox1 = document.getElementById("net-selection-first-mouse-select");
        let netCheckBox2 = document.getElementById("net-selection-second-mouse-select");
        let candidatesCheckBox1 = document.getElementById("candidates-selection-first-mouse-select");
        let candidatesCheckBox2 = document.getElementById("candidates-selection-second-mouse-select");

        switch (p.key) {
            case "e":
                netCheckBox1.checked = !netCheckBox1.checked;
                netCheckBox2.checked = false;
                candidatesCheckBox1.checked = false;
                candidatesCheckBox2.checked = false;
                break;
            case "t":
                netCheckBox1.checked = false;
                netCheckBox2.checked = !netCheckBox2.checked;;
                candidatesCheckBox1.checked = false;
                candidatesCheckBox2.checked = false;
                break;
            case "d":
                netCheckBox1.checked = false;
                netCheckBox2.checked = false;
                candidatesCheckBox1.checked = !candidatesCheckBox1.checked;
                candidatesCheckBox2.checked = false;
                break;
            case "g":
                netCheckBox1.checked = false;
                netCheckBox2.checked = false;
                candidatesCheckBox1.checked = false;
                candidatesCheckBox2.checked = !candidatesCheckBox2.checked;
                break;
            case "f":
                document.getElementById("net-selection-section").submit();
                break;
        }
    }

    p.mousePressed = () => {
        if (parent.hidden || pcbDisplayMode !== "2D" || p.mouseX < 0 || p.mouseX > p.width || p.mouseY < 0 || p.mouseY > p.height) {
            return;
        }

        downPressX = p.mouseX;
        downPressY = p.mouseY;
        downPress = true;
        for (const [i, pad] of Object.entries(layoutPads)) {
            let id = pad["id"];
            let footprintAngle = pad["footprint_angle"];
            let footprintX = pad["footprint_x"];
            let footprintY = pad["footprint_y"];
            let padX = pad["pad_x"];
            let padY = pad["pad_y"];
            let net = pad["net"];
            let sizeX = pad["size_x"] * scale;
            let sizeY = pad["size_y"] * scale;
            let shape = pad["shape"];
            let isAllowed = pad["is_allowed"];

            let radianBoardRotation = boardRotation * p.PI / 180;
            let radianFootprintAngle = footprintAngle * p.PI / 180;
            let localPadX = footprintX + padX*Math.cos(-1*radianFootprintAngle) - padY*Math.sin(-1*radianFootprintAngle);
            let localPadY = footprintY + padX*Math.sin(-1*radianFootprintAngle) + padY*Math.cos(-1*radianFootprintAngle);

            let rotatedPadX = localPadX*Math.cos(radianBoardRotation) - localPadY*Math.sin(radianBoardRotation);
            let rotatedPadY = localPadX*Math.sin(radianBoardRotation) + localPadY*Math.cos(radianBoardRotation);

            let translatedPadX = (boardRotation == 90 ? layoutDimensions.height : 0) + (boardRotation == 180 ? layoutDimensions.width : 0) + rotatedPadX;
            let translatedPadY = (boardRotation == 180 ? layoutDimensions.height: 0) + (boardRotation == 270 ? layoutDimensions.width : 0) + rotatedPadY;

            let padCenterX = centerX - p.width/2 + scale * translatedPadX;
            let padCenterY = centerY - p.height/2 + scale * translatedPadY;


            let selectedNet = ""

            const angle = radianBoardRotation - radianFootprintAngle;
            const dx = p.mouseX - padCenterX, dy = p.mouseY - padCenterY;
            const hitX = dx * Math.cos(angle) + dy * Math.sin(angle);
            const hitY = -dx * Math.sin(angle) + dy * Math.cos(angle);

            if (shape == "circle" || shape == "oval") {
                if (Math.pow(hitX / (sizeX / 2), 2) + Math.pow(hitY / (sizeY / 2), 2) <= 1) {
                    if (isAllowed) {
                        selectedNet = net;
                    }
                }
            } else if (shape == "rect" || shape == "roundrect") {
                if (Math.abs(hitX) < sizeX / 2 && Math.abs(hitY) < sizeY / 2) {
                    if (isAllowed) {
                        selectedNet = net;
                    }
                }
            }

            const hit = (shape === "circle" || shape === "oval")
                ? Math.pow(hitX / (sizeX / 2), 2) + Math.pow(hitY / (sizeY / 2), 2) <= 1
                : Math.abs(hitX) <= sizeX / 2 && Math.abs(hitY) <= sizeY / 2;
            if (isAllowed && hit) {
                selectedNet = net;
                console.log("Clicked on net: " + selectedNet);

                let netCheckBox1 = document.getElementById("net-selection-first-mouse-select");
                let netCheckBox2 = document.getElementById("net-selection-second-mouse-select");


                let selector1 = document.getElementById("net-selection-first-select")
                let selector2 = document.getElementById("net-selection-second-select")

                let candidatesCheckBox1 = document.getElementById("candidates-selection-first-mouse-select");
                let candidatesCheckBox2 = document.getElementById("candidates-selection-second-mouse-select");

                let candidatesLabel1 = document.getElementById("candidates-selection-first-label");
                let candidatesLabel2 = document.getElementById("candidates-selection-second-label");


                if (netCheckBox1.checked && availableNets.includes(selectedNet) && selector2.value != selectedNet) {
                    selector1.value = selectedNet;
                    selector1.dispatchEvent(new Event('change'));
                    netCheckBox1.checked = false;
                }
                if (netCheckBox2.checked && availableNets.includes(selectedNet) && selector1.value != selectedNet) {
                    selector2.value = selectedNet;
                    selector2.dispatchEvent(new Event('change'));
                    netCheckBox2.checked = false;
                }
                if (candidatesCheckBox1.checked) {
                    padCandidates["left"] = id;
                    selector1.value = selectedNet;
                    selector1.dispatchEvent(new Event('change'));
                    candidatesCheckBox1.checked = false;
                    candidatesLabel1.textContent = "左探针：" + (selectedNet || "无网络焊盘");

                }
                if (candidatesCheckBox2.checked) {
                    padCandidates["right"] = id;
                    selector2.value = selectedNet;
                    selector2.dispatchEvent(new Event('change'));
                    candidatesCheckBox2.checked = false;
                    candidatesLabel2.textContent = "右探针：" + (selectedNet || "无网络焊盘");
                }
                window.dispatchEvent(new CustomEvent("pcb-selection-changed"));
                return
            }
        }
    }

    p.mouseWheel = (event) => {

        if (parent.hidden || p.mouseX < 0 || p.mouseX > p.width || p.mouseY < 0 || p.mouseY > p.height) {
            return;
        }

        const factor = Math.exp(-event.delta * 0.001);
        const next = Math.max(0.05, Math.min(100, scale * factor));
        const ratio = next / scale;
        centerX = p.mouseX + p.width / 2 - (p.mouseX - centerX + p.width / 2) * ratio;
        centerY = p.mouseY + p.height / 2 - (p.mouseY - centerY + p.height / 2) * ratio;
        scale = next;
        return false;

    }

    p.mouseDragged = () => {

        if (parent.hidden || p.mouseX < 0 || p.mouseX > p.width || p.mouseY < 0 || p.mouseY > p.height) {
            return;
        }

        if (downPress) {
            centerX += p.mouseX - downPressX;
            centerY += p.mouseY - downPressY;
            downPressX = p.mouseX;
            downPressY = p.mouseY;
        }
    }
});

const Context3D = { windowResized() { window.assemblyView?.resize(); } };


function switchToSchematics() {
    let pcb2DSection = document.getElementById("main-pcb-2D-section");
    let pcb3DSection = document.getElementById("main-pcb-3D-section");
    let schematicSection = document.getElementById("main-schematics-section");

    if(schematicSection.classList.contains("main-display-button-selected")) {
        return;
    }

    pcb2DSection.hidden = true;
    pcb3DSection.hidden = true;
    schematicSection.hidden = false;

    let pcb2DButton = document.getElementById("main-display-pcb-2D-button");
    let pcb3DButton = document.getElementById("main-display-pcb-3D-button");
    let schematicButton = document.getElementById("main-display-schematics-button");

    pcb2DButton.classList.remove("main-display-button-selected");
    pcb3DButton.classList.remove("main-display-button-selected");
    schematicButton.classList.add("main-display-button-selected");

    setTimeout(() => {
        Context2D.windowResized();
        Context3D.windowResized();
    }, 200);
}

function switchToPCB(mode) {
    let selectedPcbSection = document.getElementById("main-pcb-" + mode + "-section");
    let otherPcbSection = document.getElementById("main-pcb-" + (mode === "3D" ? "2D" : "3D") + "-section");
    let schematicSection = document.getElementById("main-schematics-section");

    if(selectedPcbSection.classList.contains("main-display-button-selected")) {
        return;
    }

    otherPcbSection.hidden = true;
    schematicSection.hidden = true;
    selectedPcbSection.hidden = false;

    let pcbButton = document.getElementById("main-display-pcb-" + mode + "-button");
    let othermode = mode === "3D" ? "2D" : "3D";
    let otherButton = document.getElementById("main-display-pcb-" + othermode + "-button");
    let schematicButton = document.getElementById("main-display-schematics-button");

    schematicButton.classList.remove("main-display-button-selected");
    otherButton.classList.remove("main-display-button-selected");
    pcbButton.classList.add("main-display-button-selected");

    pcbDisplayMode = mode;

    setTimeout(() => {
        Context2D.windowResized();
        Context3D.windowResized();
    }, 200);
}
