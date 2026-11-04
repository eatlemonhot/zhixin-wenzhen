param([string]$Python='')
$ErrorActionPreference='Stop'
if (-not $Python) {
    if (Test-Path -LiteralPath 'H:/anaconda_2024.06/envs/yolo/python.exe') { $Python='H:/anaconda_2024.06/envs/yolo/python.exe' }
    else { $Python=(Get-Command python -ErrorAction Stop).Source }
}
Push-Location -LiteralPath $PSScriptRoot
try { & $Python -m pip install --target .deps -r web/requirements.lock.txt --disable-pip-version-check; if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' } }
finally { Pop-Location }
