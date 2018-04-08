@SETLOCAL

CD %SYSTEMDRIVE%\

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%


CALL "%invokePath%\..\..\START_EXIT.bat"^
 "%invokePath%\external_work.bat"^
 "Param 1" "Param 2" "Param 3"



