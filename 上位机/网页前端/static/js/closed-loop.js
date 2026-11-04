(function () {
    'use strict';
    const get = id => document.getElementById(id);
    if (!get('job-analysis-mode')) return;
    let references = [];
    function fill(select, values, key, label) {
        const chosen = select.value;
        select.replaceChildren(new Option('请选择', ''));
        for (const value of values) select.add(new Option(label(value), value[key]));
        if (values.some(value => value[key] === chosen)) select.value = chosen;
    }
    function filterReferences() {
        const calibration = get('job-calibration').value;
        const dut = get('job-dut-id').value.trim();
        fill(get('job-normal-reference'), references.filter(row => row.calibration_id === calibration && row.dut_id === dut), 'reference_id', row => row.dut_id + ' · ' + row.reference_id.slice(0, 12));
    }
    async function refresh() {
        const response = await fetch('/diagnosis/unpowered/assets', {credentials: 'same-origin', cache: 'no-store'});
        const data = await response.json();
        if (!response.ok) throw Error(data.error || '读取失败');
        references = data.references;
        fill(get('job-calibration'), data.calibrations, 'calibration_id', row => row.station_id + ' · ' + row.calibration_id.slice(0, 12));
        filterReferences();
    }
    get('job-calibration').addEventListener('change', filterReferences);
    get('job-dut-id').addEventListener('input', filterReferences);
    get('job-calibration-import').onclick = () => get('job-calibration-file').click();
    get('job-calibration-file').onchange = async event => {
        const file = event.target.files[0];
        if (!file) return;
        try {
            const payload = JSON.parse(await file.text());
            const response = await fetch('/diagnosis/unpowered/calibration', {method: 'POST', credentials: 'same-origin',
                headers: {'Content-Type': 'application/json', 'X-Requested-With': 'XMLHttpRequest'}, body: JSON.stringify(payload)});
            const data = await response.json();
            if (!response.ok) throw Error(data.error || '导入失败');
            await refresh();
            get('job-calibration').value = data.calibration_id;
            get('job-calibration').dispatchEvent(new Event('change'));
        } catch (error) {
            get('diagnostic-job-status').textContent = error.message;
        }
    };
    window.addEventListener('closedloop-assets-changed', () => refresh().catch(error => {get('diagnostic-job-status').textContent = error.message;}));
    refresh().catch(error => {get('diagnostic-job-status').textContent = error.message;});
})();
