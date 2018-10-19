@SETLOCAL

ECHO %~nx0

SET invokePath=%~dp0.

CALL "%invokePath%\cleanup_old_folders.bat" %1 %2 /T:C %3

ECHO End %~nx0