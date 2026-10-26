@echo off
chcp 65001 >nul
set "NSSM=C:\Users\admin\Downloads\Git自动同步工具包-v2.16.3-20261026-GitHub发布版\Git自动同步工具包-v2.16.3-20261026\04-一键部署\nssm_bin\nssm.exe"
"%NSSM%" stop GitAutoSync_win_learn >nul 2>&1
"%NSSM%" remove GitAutoSync_win_learn confirm >nul 2>&1
"%NSSM%" install GitAutoSync_win_learn "%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" "-NoProfile -ExecutionPolicy Bypass -File ""C:\my_data\win_learn\git_sync_realtime_GitAutoSync_win_learn.ps1"""
"%NSSM%" set GitAutoSync_win_learn ObjectName LocalSystem
"%NSSM%" set GitAutoSync_win_learn AppDirectory "C:\my_data\win_learn"
"%NSSM%" set GitAutoSync_win_learn Start SERVICE_AUTO_START
"%NSSM%" set GitAutoSync_win_learn AppExit Default Restart
"%NSSM%" set GitAutoSync_win_learn AppRestartDelay 5000
"%NSSM%" set GitAutoSync_win_learn AppStdout "C:\my_data\win_learn\git_sync_service.log"
"%NSSM%" set GitAutoSync_win_learn AppStderr "C:\my_data\win_learn\git_sync_service_err.log"
"%NSSM%" set GitAutoSync_win_learn AppRotateFiles 1
"%NSSM%" set GitAutoSync_win_learn AppRotateBytes 1048576
"%NSSM%" set GitAutoSync_win_learn AppEnvironmentExtra GIT_CONFIG_COUNT=1 GIT_CONFIG_KEY_0=safe.directory GIT_CONFIG_VALUE_0="C:/my_data/win_learn"
"%NSSM%" start GitAutoSync_win_learn
echo.
pause
