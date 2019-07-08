@SETLOCAL
@REM 
@ECHO OFF

SET invokePath=%~dp0.

ECHO Start at
ECHO %TIME%

CALL "%invokePath%\..\..\delay-seconds.bat"  5

ECHO %TIME%
ECHO Done
ECHO:


PAUSE
