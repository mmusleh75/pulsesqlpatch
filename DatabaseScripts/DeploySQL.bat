@echo off
SETLOCAL EnableDelayedExpansion

set homedir=%~dp0

if '%Python31%'=='' (
  set relativepath=..\Python31
  set suffix=
  for /L %%d in (0,1,11) do (
    if exist "!homedir!!suffix!!relativepath!" (
      set Python31=!homedir!!suffix!!relativepath!
    )
    set suffix=!suffix!..\
  )
  set suffix=
  set relativepath=
)

set pythonhome=%Python31%

set pythonpath=%pythonhome%\Python31lib.zip;%pythonhome%\lib;%pythonpath%

"%pythonhome%\python.exe" "%homedir%DeploySql.py" %*
exit /B %errorlevel%