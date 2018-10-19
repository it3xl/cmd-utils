@SETLOCAL

@SET startPath=%~dp0

@CD /D %SYSTEMDRIVE%\

@SET path=%startPath%test stuff ()

@FOR /F "eol=: delims=" %%p IN ('DIR /B /O:D /T:C /A:D "%path%"') DO @(
  ECHO:&ECHO Works fine with quotes for "%path%"
)

@ECHO:&ECHO Now see an error "was unexpected at this time"&ECHO:&ECHO:

FOR /F "eol=: delims=" %%p IN ('DIR /B /O:D /T:C /A:D "%path%"') DO (
  ECHO %path%
)

@ECHO:&ECHO ERRORLEVEL is %ERRORLEVEL%
@PAUSE