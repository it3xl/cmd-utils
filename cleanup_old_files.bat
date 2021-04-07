@SETLOCAL

ECHO %~nx0

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

CALL "%invokePath%\exit_if_error.bat"


SET error_code=0

SET cleanup_skip_newest_amount=%1
IF [%cleanup_skip_newest_amount%] EQU [] SET error_code=1001

SET target_cleanup_folder=%2
IF [%target_cleanup_folder%] EQU [] SET error_code=1002
IF [%target_cleanup_folder%] EQU [""] SET error_code=1002

@IF %error_code% NEQ 0 (
  @ECHO Exit with %error_code% error.
  EXIT %error_code%
)


SET target_cleanup_folder=%target_cleanup_folder:"=%

SET sort=%3
IF [sort] EQU []  SET sort=/T:C

SET demo=0
IF [%4] EQU [demo]  SET demo=1

REM Makes a cleanup for excessive amount of artifact files (any files, not folders).
ECHO Cleanup in %target_cleanup_folder%
ECHO Skip %cleanup_skip_newest_amount% newest items.

@REM Credits: "Why does FOR /F “skip=0” fail?"
@REM https://stackoverflow.com/questions/6452323/why-does-for-f-skip-0-fail/6452839#6452839
SET SKIP=skip=%cleanup_skip_newest_amount%
IF %cleanup_skip_newest_amount% LEQ 0 (
  SET "SKIP="
)

@REM Do not use %%~fF instead of %%F to get a full path! It is unsafe and depend on the currently executed folder!
FOR /F "%SKIP% eol=: delims=" %%F IN ('DIR /B /O:-D %sort% /A:-D "%target_cleanup_folder%"') DO (
  @REM ! SET= do not works in loops!
  ECHO deleting "%target_cleanup_folder%\%%F"
  IF %demo% EQU 0  DEL /Q /F "%target_cleanup_folder%\%%F"
)

CALL "%invokePath%\exit_if_error.bat"


ECHO End %~nx0
