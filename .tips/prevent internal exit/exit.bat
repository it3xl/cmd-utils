@ECHO OFF

ECHO Beginninbg of %~nx0

SET delay_seconds=2
ECHO Delaying for %delay_seconds% seconds

@REM The CHOISE doesn't work under VSCode.
@REM CHOICE /N /C y /D y /T  %delay_seconds%  > NUL
TypePerf "\System\Processor Queue Length" -si %delay_seconds% -sc 1 >nul


CALL REM Suppresses previous errors.

ECHO EXIT 111
EXIT 111

ECHO End of %~nx0


