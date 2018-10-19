@SETLOCAL
@REM @ECHO OFF

SET invokePath=%~dp0.

CALL "%invokePath%\..\..\cleanup_old_files.bat"  1 "%invokePath%\test stuff" /T:C demo

PAUSE