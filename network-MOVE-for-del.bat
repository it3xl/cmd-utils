@SETLOCAL

@REM ECHO OFF

@REM This logic tries to move a folder to a place where it will be later deleted.
@REM But if the folder can't be moved then it will be deleted.
@REM We need this logic because somtimes Windows locks folder renaming of moving but allows deletion of it.

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


@REM We append with 'CMD /C CALL' to prevent entire process exiting because of exiting from the 'network-MOVE.bat' file.
CMD /C CALL "%invokePath%\network-MOVE.bat"  %source%  %target%

@IF %ERRORLEVEL% NEQ 0 (
  @CALL REM Suppresses previous errors.
  @ECHO Cannot do MOVE. Let's delete
  CALL "%invokePath%\network-delete-dir.bat" %source%
)


@CALL "%invokePath%\exit_if_error"


ECHO End %~nx0
