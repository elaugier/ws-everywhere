@echo off
whoami /groups | findstr /c:" S-1-5-32-544 " | findstr /c:" Enabled group" && goto :isadministrator
whoami /groups | findstr /c:" S-1-5-32-544 " | findstr /c:" Groupe activ" && goto :isadministrator
@echo This script requires elevated rights.
exit /b 1
:isadministrator
if [%1] == [] goto usage
nssm install "%1" "%~dp0nginx.exe"
goto :eof
:usage
@echo Usage: %~n0%~x0 ^<ServiceName^>
exit /b 1
