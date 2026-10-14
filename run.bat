@echo off
setlocal EnableExtensions DisableDelayedExpansion

if "%~1"=="" (
    >&2 echo Usage: run.bat "path\to\file.env"
    exit /b 1
)

if not "%~2"=="" (
    >&2 echo Usage: run.bat "path\to\file.env"
    exit /b 1
)

if not exist "%~f1" (
    >&2 echo Environment file not found: "%~f1"
    exit /b 1
)

rem Load KEY=value lines, skipping blank lines and comments starting with #.
for /f "usebackq eol=# delims=" %%A in ("%~f1") do set "%%A"

pushd "%~dp0"
if errorlevel 1 exit /b 1

call gradlew.bat bootRun
set "RUN_EXIT_CODE=%ERRORLEVEL%"

popd
exit /b %RUN_EXIT_CODE%
