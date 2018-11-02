@ECHO OFF

ECHO Beginninbg of %~nx0

SET delay_seconds=2
ECHO Delaying for %delay_seconds% seconds
CHOICE /N /C y /D y /T  %delay_seconds%  > NUL

CALL REM Suppresses previous errors.

ECHO EXIT 111
EXIT 111

ECHO End of %~nx0


