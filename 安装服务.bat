@echo off
chcp 65001 >nul
set "NSSM=C:\Users\admin\Downloads\Git自动同步工具包-v2.16.2-20261026-GitHub发布版\Git自动同步工具包-v2.16.2-20261026\04-一键部署\nssm_bin\nssm.exe"
"%NSSM%" stop GitAutoSync_my_data >nul 2>&1
"%NSSM%" remove GitAutoSync_my_data confirm >nul 2>&1
"%NSSM%" install GitAutoSync_my_data "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" "-NoProfile -ExecutionPolicy Bypass -File ""C:\my_data\git_sync_realtime_GitAutoSync_my_data.ps1"""
"%NSSM%" set GitAutoSync_my_data ObjectName LocalSystem
"%NSSM%" set GitAutoSync_my_data AppDirectory "C:\my_data"
"%NSSM%" set GitAutoSync_my_data Start SERVICE_AUTO_START
"%NSSM%" set GitAutoSync_my_data AppExit Default Restart
"%NSSM%" set GitAutoSync_my_data AppRestartDelay 5000
"%NSSM%" set GitAutoSync_my_data AppStdout "C:\my_data\git_sync_service.log"
"%NSSM%" set GitAutoSync_my_data AppStderr "C:\my_data\git_sync_service_err.log"
"%NSSM%" set GitAutoSync_my_data AppRotateFiles 1
"%NSSM%" set GitAutoSync_my_data AppRotateBytes 1048576
"%NSSM%" set GitAutoSync_my_data AppEnvironmentExtra GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0="C:/my_data"
"%NSSM%" start GitAutoSync_my_data
echo.
pause
