@SETLOCAL
@REM 
@ECHO OFF

SET invokePath=%~dp0.

CALL "%invokePath%\..\..\cleanup_old_folders.bat"  1 "%invokePath%\test stuff" /T:C demo

PAUSE