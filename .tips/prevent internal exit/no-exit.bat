@ECHO OFF

ECHO Beginninbg of %~nx0

SET delay_seconds=2
ECHO Delaying for %delay_seconds% seconds
CHOICE /N /C y /D y /T  %delay_seconds%  > NUL

CALL REM Suppresses previous errors.

ECHO EXIT /B 222
EXIT /B 222

ECHO End of %~nx0


