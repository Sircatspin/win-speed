
@ off
echo Starting Windows Optimization...

:main_menu
cls
echo Please select an option:
echo.
echo a1. Disable Windows service
echo a2. Disable Superfetch service Search
echo a3. Disable unnecessary startup programs
echo a4. Disable UAC (User Account Control)
echo a5. Disable unnecessary visual effects
echo a6. Set power plan to performance
echo a7. high Disable unnecessary services (example)
echo a8. Enable Bluetooth service
echo a9. Enable disk cleanup wizard
echo a10. Set maximum processor state to 100%
echo a11. Disable Windows Error Reporting
echo a12. Disable hibernation
echo a13. Disable Prefetch and Superfetch
echo a14. Disable Windows Update automatic restart
echo a15. Disable Remote Assistance
echo a16. Disable Error Reporting
echo a17. Disable Windows Defender
echo a18. Disable Toast Notifications
echo a19. Disable App Suggestions and Notifications
echo a20. Disable AutoPlay
echo a21. Disable Windows Tips
echo a22. Disable Background Apps
echo a23. Disable Quick Access Recent Files
echo a24. Disable Windows Script Host
echo a25. Set default program associations
echo a26. Disable Desktop Background Slideshow
echo a27. Enable Large System Cache
echo a28. Reduce Menu Show Delay
echo.
echo b. Execute selected tweaks
echo q. Quit

setlocal enabledelayedexpansion
set /p option=Enter the option number:

if "!option!"=="a1" (
    echo Disabling Windows Search service...
    sc config "WSearch" start=disabled
    set "a1_status=[enabled]"
    goto main_menu
)

if "!option!"=="a2" (
    echo Disabling Superfetch service...
    sc config "SysMain" start=disabled
    set "a2_status=[enabled]"
    goto main_menu
)

if "!option!"=="a3" (
    echo Disabling unnecessary startup programs...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "ProgramName" /d "C:\Path\To\Program.exe" /f
    set "a3_status=[enabled]"
    goto main_menu
)

if "!option!"=="a4" (
    echo Disabling UAC...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
    set "a4_status=[enabled]"
    goto main_menu
)

if "!option!"=="a5" (
    echo Disabling unnecessary visual effects...
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
    set "a5_status=[enabled]"
    goto main_menu
)

if "!option!"=="a6" (
    echo Setting power plan to high performance...
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    set "a6_status=[enabled]"
    goto main_menu
)

if "!option!"=="a7" (
    echo Disabling unnecessary services...
    sc config "Fax" start=disabled
    set "a7_status=[enabled]"
    goto main_menu
)

if "!option!"=="a8" (
    echo Enabling Bluetooth service...
    sc config "BthServ" start=demand
    set "a8_status=[enabled]"
    goto main_menu
)

if "!option!"=="a9" (
    echo Enabling disk cleanup wizard...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v "StateFlags" /t REG_DWORD /d 0 /f
    set "a9_status=[enabled]"
    goto main_menu
)

if "!option!"=="a10" (
    echo Setting maximum processor state to 100%...
    powercfg -setacvalueindex scheme_current sub_processor PROCTHROTTLEMAX 100
    powercfg -setactive scheme_current
    set "a10_status=[enabled]"
    goto main_menu
)

if "!option!"=="a11" (
    echo Disabling Windows Error Reporting...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
    set "a11_status=[enabled]"
    goto main_menu
)

if "!option!"=="a12" (
    echo Disabling hibernation...
    powercfg /h off
    set "a12_status=[enabled]"
    goto main_menu
)

if "!option!"=="a13" (
    echo Disabling Prefetch and Superfetch...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f
    set "a13_status=[enabled]"
    goto main_menu
)

if "!option!"=="a14" (
    echo Disabling Windows Update automatic restart...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d 1 /f
    set "a14_status=[enabled]"
    goto main_menu
)

if "!option!"=="a15" (
    echo Disabling Remote Assistance...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f
    set "a15_status=[enabled]"
    goto main_menu
)

if "!option!"=="a16" (
    echo Disabling Error Reporting...
    reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
    set "a16_status=[enabled]"
    goto main_menu
)

if "!option!"=="a17" (
    echo Disabling Windows Defender...
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
    set "a17_status=[enabled]"
    goto main_menu
)

if "!option!"=="a18" (
    echo Disabling Toast Notifications...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d 0 /f
    set "a18_status=[enabled]"
    goto main_menu
)

if "!option!"=="a19" (
    echo Disabling App Suggestions and Notifications...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
    set "a19_status=[enabled]"
    goto main_menu
)

if "!option!"=="a20" (
    echo Disabling AutoPlay...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /t REG_DWORD /d 255 /f
    set "a20_status=[enabled]"
    goto main_menu
)

if "!option!"=="a21" (
    echo Disabling Windows Tips...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f
    set "a21_status=[enabled]"
    goto main_menu
)

if "!option!"=="a22" (
    echo Disabling Background Apps...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f
    set "a22_status=[enabled]"
    goto main_menu
)

if "!option!"=="a23" (
    echo Disabling Quick Access Recent Files...
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowRecentPlaces" /t REG_DWORD /d 0 /f
    set "a23_status=[enabled]"
    goto main_menu
)

if "!option!"=="a24" (
    echo Disabling Windows Script Host...
    reg add "HKCU\SOFTWARE\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d 0 /f
    set "a24_status=[enabled]"
    goto main_menu
)

if "!option!"=="a25" (
    echo Setting default program associations...
    ftype txtfile="C:\Path\To\TextEditor.exe" "%1"
    assoc .txt=txtfile
    set "a25_status=[enabled]"
    goto main_menu
)

if "!option!"=="a26" (
    echo Disabling Desktop Background Slideshow...
    reg add "HKCU\Control Panel\Desktop" /v "SlideShowInterval" /t REG_SZ /d 0 /f
    set "a26_status=[enabled]"
    goto main_menu
)

if "!option!"=="a27" (
    echo Enabling Large System Cache...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d 1 /f
    set "a27_status=[enabled]"
    goto main_menu
)

if "!option!"=="a28" (
    echo Reducing Menu Show Delay...
    reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 50 /f
    set "a28_status=[enabled]"
    goto main_menu
)

if "!option!"=="b" (
    echo Executing selected tweaks...
    goto exit
)

if "!option!"=="q" (
    echo Exiting...
    goto exit
)

echo Invalid option. Please try again.
timeout /t 2 >nul
goto main_menu

:exit
echo Windows Optimization completed successfully!
pause
