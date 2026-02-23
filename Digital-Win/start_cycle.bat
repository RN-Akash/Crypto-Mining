@REM @echo off
@REM setlocal enabledelayedexpansion

@REM :: Get script directory
@REM set SCRIPT_DIR=%~dp0

@REM :: Set path to xmrig
@REM set XMRIG_PATH=%SCRIPT_DIR%xmrig.exe

@REM :: Duration settings (in seconds)
@REM set RUN_DURATION=7200
@REM set SLEEP_DURATION=1800

@REM echo Starting xmrig run/pause cycle...

@REM :loop
@REM echo %date% %time%: Starting xmrig...
@REM start "" "%XMRIG_PATH%" -c "%SCRIPT_DIR%config.json"
@REM :: Wait RUN_DURATION seconds
@REM timeout /t %RUN_DURATION% /nobreak >nul
@REM echo %date% %time%: Stopping xmrig...
@REM taskkill /IM xmrig.exe /F >nul 2>&1
@REM echo %date% %time%: Sleeping...
@REM timeout /t %SLEEP_DURATION% /nobreak >nul

@REM goto loop

@echo off
set SCRIPT_DIR=%~dp0
set RUN_DURATION=7200
set SLEEP_DURATION=1800

:loop
start "" /B "%SCRIPT_DIR%xmrig.exe" -c "%SCRIPT_DIR%config.json"
timeout /t %RUN_DURATION% /nobreak >nul
taskkill /IM xmrig.exe /F >nul 2>&1
timeout /t %SLEEP_DURATION% /nobreak >nul
goto loop