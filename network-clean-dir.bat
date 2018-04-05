@SETLOCAL

@ECHO %~nx0

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@CALL "%invokePath%\exit_if_error"

SET clean_dir_path=%1
IF [%clean_dir_path%] EQU [] EXIT 1001
IF [%clean_dir_path%] EQU [""] EXIT 1001

@ECHO Clean folder %clean_dir_path%


CALL "%invokePath%\network-delete-dir.bat" %clean_dir_path%


MKDIR %clean_dir_path%

@CALL "%invokePath%\exit_if_error"


ECHO End %~nx0
