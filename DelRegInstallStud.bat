@echo off
REM Deletes LanSchool and Installer registry keys.

reg delete "HKLM\SOFTWARE\Classes\Installer\Products\BABAE78ECF4207D47A4E62323550704A" /f /reg:64
reg delete "HKCU\SOFTWARE\Classes\Installer\Products\BABAE78ECF4207D47A4E62323550704A" /f /reg:64

reg delete "HKLM\SOFTWARE\LanSchool" /f /reg:64
reg delete "HKLM\SOFTWARE\WOW6432Node\LanSchool" /f /reg:64
reg delete "HKLM\SOFTWARE\LanSchool" /f /reg:32
reg delete "HKLM\SOFTWARE\WOW6432Node\LanSchool" /f /reg:32

echo Registry keys deleted.
pause

@echo off
REM Install LanSchool Student Silent like

REM Define the network path to the MSI file
set MSIPath=\\PATH TO STUDENT.MSI

REM Run the installer silently
start /wait msiexec /i "%MSIPath%" CHANNEL=30 /qn /norestart

echo Installation initiated silently.
pause

