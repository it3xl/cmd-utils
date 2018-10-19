@SETLOCAL

ECHO %~nx0

SET invokePath=%~dp0.

CALL "%invokePath%\cleanup_old_files.bat" %1 %2 /T:W %3

ECHO End %~nx0