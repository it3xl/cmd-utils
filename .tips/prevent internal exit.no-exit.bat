@REM 
@ECHO OFF

@ECHO %~nx0 start

ECHO.
SET delay_seconds=4
ECHO Delaying for %delay_seconds% seconds
CHOICE /N /C y /D y /T  %delay_seconds%  > NUL

CALL REM Suppresses previous errors.

ECHO.
ECHO No EXIT without /B call here!
EXIT /B 222

ECHO.
@ECHO %~nx0 end


