@SETLOCAL

@ECHO %~nx0

SET reg_key=%~1
IF ["%reg_key%"] EQU [""] EXIT 1001

@ECHO deletion for: "%reg_key%"

@REM /reg:64 - Disables implicit redirection to Wow6432Node branch on x64 systems under a x86 processes.
@REM So, you forced here to use explicit keys. As an example:
@REM For x86 apps on x64 systems you must use "Wow6432Node" like this HKLM\Software\Wow6432Node\...

REG DELETE "%reg_key%" /va /f  /reg:64

@REM Let's add an indentation if an error is emitted.
IF %ERRORLEVEL% NEQ 0  ECHO:


@REM It is decided that this always suppress REG DELETE errors.
@CALL REM Suppress previous CMD errors.


