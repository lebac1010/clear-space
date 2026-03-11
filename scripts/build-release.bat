@echo off
REM Build signed Android App Bundle (.aab) for Google Play Console.
REM Wrapper for scripts/build-release.ps1

echo.
echo ============================================
echo   Clean Master Space - Android Release Builder
echo ============================================
echo.

where powershell >nul 2>&1
if %ERRORLEVEL% neq 0 (
  echo [ERROR] PowerShell not found.
  exit /b 1
)

set "SCRIPT_DIR=%~dp0"
powershell -ExecutionPolicy Bypass -File "%SCRIPT_DIR%build-release.ps1" %*
exit /b %ERRORLEVEL%
