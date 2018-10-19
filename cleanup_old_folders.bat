@SETLOCAL

@ECHO %~nx0



@REM Be aware that this solution doesn't work if a sub-folder or a file is blocked/locked.
@REM The following approach isn't helpful https://stackoverflow.com/questions/11137702/rd-exits-with-errorlevel-set-to-0-on-error-when-deletion-fails-etc/11137825#11137825
@REM Consider to use any another technology.
@REM See also https://ss64.com/nt/syntax-delolder.html



SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

SET worker=%~f0

CALL "%invokePath%\exit_if_error.bat"

SET cleanup_skip_newest_amount=%1
IF [%cleanup_skip_newest_amount%] EQU [] EXIT 1001

SET target_cleanup_folder=%2
IF [%target_cleanup_folder%] EQU [] EXIT 1002
IF [%target_cleanup_folder%] EQU [""] EXIT 1002
SET target_cleanup_folder=%target_cleanup_folder:"=%

SET sort=%3
IF [sort] EQU []  SET sort=/T:C

SET demo=0
IF [%4] EQU [demo]  SET demo=1

REM Makes a cleanup for excessive amount of folders (any folders, not files).
ECHO Cleanup of %target_cleanup_folder%
ECHO Skip %cleanup_skip_newest_amount% newest items.

@REM Credits: "Why does FOR /F “skip=0” fail?"
@REM https://stackoverflow.com/questions/6452323/why-does-for-f-skip-0-fail/6452839#6452839
SET SKIP=skip=%cleanup_skip_newest_amount%
IF %cleanup_skip_newest_amount% LEQ 0 (
  SET "SKIP="
)


ECHO Check the access to %target_cleanup_folder%
DIR /B "%target_cleanup_folder%">NUL
CALL "%invokePath%\exit_if_error.bat"

@REM Do not use %%~fF instead of %%F to get a full path! It is unsafe and depends on the current executed folder!
FOR /F "%SKIP% eol=: delims=" %%F IN ('DIR /B /O:-D %sort% /A:D "%target_cleanup_folder%"') DO (
  @REM ! SET= doesn't work in loops out of the box!

  ECHO deleting "%target_cleanup_folder%\%%F"
  IF %demo% EQU 0  RD /S /Q "%target_cleanup_folder%\%%F"

  @REM With Windows shared folders we always get the following case with the error "The directory is not empty"
  @REM # RD C:\bla\ouch
  @REM # C:\bla\ouch\SOME~1\InnerFolder - The directory is not empty.
  @REM A workaround is to run the RD command for the second time.
  @REM https://stackoverflow.com/questions/22948189/batch-getting-the-directory-is-not-empty-on-rmdir-command/22949687#22949687
  IF EXIST "%target_cleanup_folder%\%%F" (
    IF %demo% EQU 0  RD /S /Q "%target_cleanup_folder%\%%F"
  )
)

CALL "%invokePath%\exit_if_error.bat"
(
  ECHO Cleaned up at %DATE% %TIME%
  ECHO from %COMPUTERNAME%
  ECHO by "%worker%"
)>"%target_cleanup_folder%\.cleanup.log"

CALL "%invokePath%\exit_if_error.bat"


ECHO End %~nx0
