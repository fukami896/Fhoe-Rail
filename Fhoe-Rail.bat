@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
CD /D "%~dp0"
TITLE Fhoe-Rail

REM >nul 2>&1 REG.exe query "HKU\S-1-5-19" || (
REM     ECHO Set UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
REM     ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
REM     "%TEMP%\Getadmin.vbs"
REM     DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
REM     Exit /b
REM )

:continue

REM Prefer the user's full Python (embeddable python lacks tkinter & script dir in path)
REM set "PYTHON_BIN=python"
REM if exist "%LOCALAPPDATA%\Python\bin\python.exe" set "PYTHON_BIN=%LOCALAPPDATA%\Python\bin\python.exe"

set "OPTION="

type menu.txt
echo.

choice /C 123456 /T 5 /D 2 /N >nul

if errorlevel 6 (
    uv run -- python -i -X utf8 webui\launch.py --white
    echo.
    pause
    goto :end
) else if errorlevel 5 (
    uv run -- python -i -X utf8 webui\launch.py --dev
    echo.
    pause
    goto :end
) else if errorlevel 4 (
    uv run -- python -i -X utf8 webui\launch.py --record
    echo.
    pause
    goto :end
) else if errorlevel 3 (
    uv run -- python -i -X utf8 webui\launch.py --debug
    echo.
    pause
    goto :end
) else if errorlevel 2 (
    uv run -- python -i -X utf8 webui\launch.py --debug
    echo.
    pause
    goto :end
) else (
    uv run -- python tools/install_requirements.py
    echo.
    goto :start_script
)

:start_script
    uv run -- python -i -X utf8 webui\launch.py --debug
echo.
pause
goto :end

:end
