@echo off
SETLOCAL EnableDelayedExpansion

set pythonhome=%~dp0
set pythonpath=%~dp0\Python31lib.zip;%~dp0\lib;%pythonpath%
"%pythonhome%\python.exe" %*
exit /B %errorlevel%