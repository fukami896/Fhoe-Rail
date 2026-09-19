@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Fhoe-Rail WebUI

REM Prefer the user's full Python
REM set "PYTHON_BIN=python"
REM if exist "%LOCALAPPDATA%\Python\bin\python.exe" set "PYTHON_BIN=%LOCALAPPDATA%\Python\bin\python.exe"

echo ================================================
echo   Fhoe-Rail WebUI - Star Rail Control Panel
echo   Using uv to run the service.
echo   Browser will open automatically.
echo   Press ENTER in this window to stop the service.
echo ================================================
echo.
REM %PYTHON_BIN% webui/server.py
uv run -- python webui\server.py
if errorlevel 1 (
    echo.
    echo [ERROR] WebUI failed to start. Check:
    echo   - Python 3 installed and runnable
    echo   - Port 8666 held by another program (a running Fhoe-Rail WebUI is taken over automatically)
    echo   - If held by an older WebUI build: press ENTER in its window to quit, then retry
    echo.
    pause
)
