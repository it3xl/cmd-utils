@SETLOCAL

@ECHO %~nx0

SET reg_key=%~1
IF ["%reg_key%"] EQU [""] EXIT 1001

@ECHO %~nx0 "%reg_key%"

REG DELETE "%reg_key%" /va /f


@REM Will exit with 0 exit code to prevent spam to ERRORLEVEL if process not started.
@EXIT /B 0


