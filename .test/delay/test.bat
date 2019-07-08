@SETLOCAL
@REM 
@ECHO OFF

SET invokePath=%~dp0.

ECHO Start at
ECHO %TIME%

CALL "%invokePath%\..\..\delay-seconds.bat"  10

ECHO %TIME%
ECHO Done
ECHO:


PAUSE
