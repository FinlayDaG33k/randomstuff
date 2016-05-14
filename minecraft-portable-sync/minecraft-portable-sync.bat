@echo off
echo How do you want to sync?
echo [0] Local to USB
echo [1] USB to Local

set /p mode=Enter the Mode you want:%=%
@echo %mode%


IF %mode%==0 (
	xcopy "%appdata%\.minecraft" "%CD%\test" /S /V /Q
)


IF %mode%==1 (
	xcopy %CD%\data "%appdata%\.minecraft" /S /V /Q
)

pause