@echo off
setlocal
cd /d "%~dp0"
if exist "MonitoringDesk.exe" goto verify
for %%F in (MonitoringDesk.part01 MonitoringDesk.part02 MonitoringDesk.part03 MonitoringDesk.part04 MonitoringDesk.part05) do (
  if not exist "%%F" (
    echo Missing %%F. Extract the complete downloaded ZIP into one folder.
    pause
    exit /b 1
  )
)
echo Preparing MonitoringDesk.exe. Please wait...
copy /b "MonitoringDesk.part01"+"MonitoringDesk.part02"+"MonitoringDesk.part03"+"MonitoringDesk.part04"+"MonitoringDesk.part05" "MonitoringDesk.exe" >nul
if errorlevel 1 (
  echo Unable to create the application. Use a writable local folder.
  pause
  exit /b 1
)
:verify
powershell.exe -NoProfile -Command "$actual = (Get-FileHash -LiteralPath 'MonitoringDesk.exe' -Algorithm SHA256).Hash; if ($actual -ne 'B1A79AABBE992D9E0516F52ACA6245070C408F229D4B66683A75AEEBC586AA8D') { exit 1 }"
if errorlevel 1 (
  echo Integrity check failed. Do not run this file. Download the complete package again.
  pause
  exit /b 1
)
start "" "%~dp0MonitoringDesk.exe"
exit /b 0
