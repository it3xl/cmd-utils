@REM 
@ECHO OFF

@ECHO %~nx0 start
ECHO.
ECHO.

ECHO.
START "Batch-file with EXIT 111 command invocation" /wait CMD /C "%CD%\prevent internal exit.exit.bat"
ECHO Interanl exit is prevented.
ECHO ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO Checking non blocking invocation.
START "Batch-file with EXIT /B 222 command invocation" /wait CMD /C "%CD%\prevent internal exit.no-exit.bat"
ECHO ERRORLEVEL is %ERRORLEVEL%


ECHO.
ECHO.
ECHO.
@ECHO %~nx0 end
ECHO.

PAUSE
