@echo off
echo Welcome to the MCPS script by FinlayDaG33k!
echo This script should be used at own risk (MIT License)

:menu
echo How do you want to sync?
echo [1] Local to USB (Date mode)
echo [2] Local to USB (Clean mode)
echo [3] USB to Local (Date mode)
echo [4] USB to Local (Clean mode)

for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set ldt=%ldt:~4,2%-%ldt:~6,2%-%ldt:~0,4% 
set /p mode=Enter the Mode you want:%=%


IF %mode%==1 (
	xcopy "%appdata%\.minecraft" "%CD%\data\.minecraft" /S /V /Q /J /Y /I
)

IF %mode%==2 (
	rmdir /S /Q "%CD%\data\.minecraft"
	xcopy "%appdata%\.minecraft" "%CD%\data\.minecraft" /S /V /Q /J /Y /I
)

IF %mode%==3 (
	xcopy %CD%\data\.minecraft "%appdata%\.minecraft" /S /V /Q /J /Y /I
)

IF %mode%==4 (
	rmdir "%appdata%\.minecraft"
	xcopy %CD%\data\.minecraft "%appdata%\.minecraft" /S /V /Q /J /Y /I
)


pause
