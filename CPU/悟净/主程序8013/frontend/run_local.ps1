param([int]$Port=8010,[string]$Python='')
$ErrorActionPreference='Stop'
if (-not $Python) {
    if (Test-Path -LiteralPath 'H:/anaconda_2024.06/envs/yolo/python.exe') { $Python='H:/anaconda_2024.06/envs/yolo/python.exe' }
    else { $Python=(Get-Command python -ErrorAction Stop).Source }
}
Push-Location -LiteralPath $PSScriptRoot
try { & $Python scripts/start_web.py --host 127.0.0.1 --port $Port }
finally { Pop-Location }
