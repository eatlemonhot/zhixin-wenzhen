const socket = io.connect(location.origin, {
    path: "/socket.io",
    cors: {
        origin: "*",
        methods: ["GET", "POST"]
    },
    agent: false,
    upgrade: false,
    rejectUnauthorized: false,
    transports: ["websocket"],
});


socket.on("connect", () => {
    console.log("Connected to socket.io server");
    socket.emit("list_nets");
    socket.emit("get_schematics_path");
    socket.emit("list_edges");
    socket.emit("list_pads");
    socket.emit("list_dimensions");
});


socket.on("nets", (nets) => {
    let firstNetSelect = document.getElementById("net-selection-first-select");
    let secondNetSelect = document.getElementById("net-selection-second-select");
    firstNetSelect.innerHTML = "";
    secondNetSelect.innerHTML = "";
    availableNets = nets;
    nets.forEach((net) => {
        var option = document.createElement("option");
        option.value = net;
        option.text = net;
        firstNetSelect.appendChild(option);
        option = document.createElement("option");
        option.value = net;
        option.text = net;
        secondNetSelect.appendChild(option);
    });

    if (nets.includes("VCC")) {
        firstNetSelect.value = "VCC";
    } else if (nets.includes("+3V3")) {
        firstNetSelect.value = "+3V3";
    } else if (nets.includes("+5V")) {
        firstNetSelect.value = "+5V";
    } else {
        firstNetSelect.value = nets[0];
    }

    if (nets.includes("GND")) {
        secondNetSelect.value = "GND";
    } else {
        secondNetSelect.value = nets[1];
    }
});


socket.on("probe_candidates", (candidates) => {
    padCandidates = candidates;

    let candidatesLabel1 = document.getElementById("candidates-selection-first-label");
    let candidatesLabel2 = document.getElementById("candidates-selection-second-label");

    candidatesLabel1.textContent = "左探针：" + (layoutPads[candidates.left] ? layoutPads[candidates.left].net : "未选择");
    candidatesLabel2.textContent = "右探针：" + (layoutPads[candidates.right] ? layoutPads[candidates.right].net : "未选择");
    window.dispatchEvent(new CustomEvent("pcb-selection-changed"));
});

socket.on("net_selection_error", (error) => {
    console.log(error);
    let statusP = document.getElementById("net-selection-status");
    statusP.innerHTML = error;
    statusP.classList.add("error");
    statusP.classList.remove("success");
});


socket.on("edges", (edges) => {
    layoutEdges = edges;
});

socket.on("pads", (pads) => {
    console.log(pads);
    layoutPads = pads;
    padCandidates = {
        left: pads[padCandidates.left] ? padCandidates.left : "",
        right: pads[padCandidates.right] ? padCandidates.right : ""
    };
    window.dispatchEvent(new CustomEvent("pcb-layout-changed"));
});

socket.on("dimensions", (dimensions) => {
    console.log(dimensions);
    layoutDimensions = dimensions;
    switchOrientation(dimensions["orientation"]);
    window.dispatchEvent(new CustomEvent("pcb-layout-changed"));
});


function switchOrientation(angle) {
    let toWord = angle === 0 ? "first" : angle === 90 ? "second" : angle === 180 ? "third" : "fourth";
    let selectedOrientationButton = document.getElementById("orientation-selection-" + toWord + "-button");
    let orientationButtons = document.getElementsByClassName("orientation-selection-button");


    for(let i = 0; i < orientationButtons.length; i++) {
        orientationButtons[i].classList.remove("orientation-selection-button-selected");
    }

    selectedOrientationButton.classList.add("orientation-selection-button-selected");

    boardRotation = angle;

    socket.emit("board_orientation", angle);
    Context2D.fitBoard();
    window.dispatchEvent(new CustomEvent("pcb-layout-changed"));
}

document.addEventListener("keydown", (event) => {
    if (event.repeat || (event.target && event.target.matches("input, textarea, select, [contenteditable='true']"))) return;
    if(event.key == "r") {
        let angle = boardRotation + 90;
        if(angle == 360) {
            angle = 0;
        }
        console.log("Rotating board to " + angle + " degrees");
        console.log("Board rotation: " + boardRotation);
        switchOrientation(angle);
    }
    if (event.key == "p" && typeof window.sendProbeCommand === "function") {
        window.sendProbeCommand();
    }
});
