@SETLOCAL

@ECHO %~n0

SET procName=%~1
IF ["%procName%"] EQU [""] EXIT 1001

@ECHO %~n0 "%procName%"

TSKILL "%procName%" /A


@REM Will exit with 0 exit code to prevent spam to ERRORLEVEL if process not started.
@EXIT /B 0


