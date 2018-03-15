@REM 
@ECHO OFF

@ECHO %~nx0 start
ECHO.
ECHO.
ECHO.

START "dummy title" /wait ".\prevent internal exit.worker.bat"

ECHO Interanl exit is prevented.

ECHO.
ECHO.
ECHO.
@ECHO %~nx0 end
ECHO.

PAUSE
