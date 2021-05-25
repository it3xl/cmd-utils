@SETLOCAL

@ECHO %~nx0

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@CALL "%invokePath%\exit_if_error"


SET error_code=0

SET source=%1
IF [%source%] EQU [] SET error_code=1001
IF [%source%] EQU [""] SET error_code=1001

SET target=%2
IF [%target%] EQU [] SET error_code=1002
IF [%target%] EQU [""] SET error_code=1002

@IF %error_code% NEQ 0 (
  @ECHO Exit with %error_code% error.
  EXIT %error_code%
)



ROBOCOPY %*  /S  /Z  /W:1 /R:300 /TBD   /NP /FP /NS /V


IF %ERRORLEVEL% LEQ 4 EXIT /B 0
EXIT %ERRORLEVEL%




