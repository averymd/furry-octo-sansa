@echo off
rem setx DT_DISABLEINITIALLOGGING true
powershell -File C:\Users\maweir\Documents\blink1-scripts\new-mail.ps1
for /F "tokens=*" %%a in (d:\blink-new-mail-temp.txt) do set "color=%%a"
rem set /p color=<d:\blink-new-mail-temp.txt

echo "%color%"