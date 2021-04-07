@SETLOCAL

@ECHO %~nx0

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@CALL "%invokePath%\exit_if_error"


SET error_code=0

SET clean_dir_path=%1
IF [%clean_dir_path%] EQU [] SET error_code=1001
IF [%clean_dir_path%] EQU [""] SET error_code=1001

@IF %error_code% NEQ 0 (
  @ECHO Exit with %error_code% error.
  EXIT %error_code%
)


@ECHO Clean folder %clean_dir_path%


REM Let's clear a folder.
RD /S /Q %clean_dir_path%
MKDIR %clean_dir_path%


@CALL "%invokePath%\exit_if_error"

@ECHO END %~nx0
