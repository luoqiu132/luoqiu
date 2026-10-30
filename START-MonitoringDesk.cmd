@echo off
setlocal
cd /d "%~dp0"
if not exist "MonitoringDesk.exe" goto assemble
powershell.exe -NoProfile -Command "$actual=(Get-FileHash -LiteralPath 'MonitoringDesk.exe' -Algorithm SHA256 -ErrorAction Stop).Hash; if ($actual -ne '395a44a93eec74366e459e32d40a5fc232c2b71927785147211e48fb36513de2') { exit 1 }"
if not errorlevel 1 goto launch
echo Updating MonitoringDesk to 1.0.1...
:assemble
for %%F in (MonitoringDesk.part01 MonitoringDesk.part02 MonitoringDesk.part03 MonitoringDesk.part04 MonitoringDesk.part05) do (
  if not exist "%%F" (
    echo Missing %%F. Extract the complete downloaded ZIP into one folder.
    pause
    exit /b 1
  )
)
echo Preparing MonitoringDesk.exe. Please wait...
copy /b "MonitoringDesk.part01"+"MonitoringDesk.part02"+"MonitoringDesk.part03"+"MonitoringDesk.part04"+"MonitoringDesk.part05" "MonitoringDesk.pending.exe" >nul
if errorlevel 1 (
  echo Unable to prepare the application. Use a writable local folder.
  pause
  exit /b 1
)
powershell.exe -NoProfile -Command "$actual=(Get-FileHash -LiteralPath 'MonitoringDesk.pending.exe' -Algorithm SHA256 -ErrorAction Stop).Hash; if ($actual -ne '395a44a93eec74366e459e32d40a5fc232c2b71927785147211e48fb36513de2') { exit 1 }"
if errorlevel 1 (
  echo Integrity check failed. The existing application was not replaced.
  pause
  exit /b 1
)
move /y "MonitoringDesk.pending.exe" "MonitoringDesk.exe" >nul
if errorlevel 1 (
  echo Close the old MonitoringDesk window and run this script again.
  pause
  exit /b 1
)
:launch
start "" "%~dp0MonitoringDesk.exe"
exit /b 0
