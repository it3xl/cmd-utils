@SETLOCAL

@ECHO %~nx0
@CALL %q_env_cmd_util%\exit_if_error

SET cleanup_skip_newest_amount=%1
IF [%cleanup_skip_newest_amount%] EQU [] EXIT 1001

SET target_cleanup_folder=%2
IF [%target_cleanup_folder%] EQU [] EXIT 1002
IF [%target_cleanup_folder%] EQU [""] EXIT 1002
SET target_cleanup_folder=%target_cleanup_folder:"=%


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
FOR /F "%SKIP% eol=: delims=" %%F IN ('DIR /B /O:-D /A:-D "%target_cleanup_folder%"') DO (
  @REM ! SET= do not works in loops!
  ECHO deleting %target_cleanup_folder%\%%F
  DEL /Q /F "%target_cleanup_folder%\%%F"
)

@CALL %q_env_cmd_util%\exit_if_error


ECHO End of %~nx0
