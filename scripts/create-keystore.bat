@echo off
REM Create Android upload keystore for Clean Master Space.
REM Wrapper for scripts/create-keystore.ps1

echo.
echo ============================================
echo   Clean Master Space - Android Keystore Generator
echo ============================================
echo.

where powershell >nul 2>&1
if %ERRORLEVEL% neq 0 (
  echo [ERROR] PowerShell not found.
  exit /b 1
)

set "SCRIPT_DIR=%~dp0"
powershell -ExecutionPolicy Bypass -File "%SCRIPT_DIR%create-keystore.ps1" %*
exit /b %ERRORLEVEL%
