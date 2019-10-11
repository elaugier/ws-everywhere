@echo off
whoami /groups | findstr /c:" S-1-5-32-544 " | findstr /c:" Enabled group" && goto :isadministrator
whoami /groups | findstr /c:" S-1-5-32-544 " | findstr /c:" Groupe activ" && goto :isadministrator
@echo This script requires elevated rights.
exit /b 1
:isadministrator
if [%1] == [] goto usage
set PATH=%~dp0python;%~dp0cmake\bin;%PATH%
nssm install "%1" "%~dp0nginx.exe"
set addpaths=%~dp0python;%~dp0cmake\bin;
@echo %addpaths%
nssm set "%1" AppEnvironmentExtra PATH=%addpaths%^%PATH^%
python --version
cmake --version
goto :eof
:usage
@echo Usage: %~n0%~x0 ^<ServiceName^>
exit /b 1
