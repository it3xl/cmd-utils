@SETLOCAL

@ECHO %~nx0

SET seconds=%1
IF [%seconds%] EQU [] (
    ECHO ERROR! Empty first input parameter.
    EXIT 1001
)

@ECHO Delay for %seconds% seconds.

@REM CHOICE doesn't work under the non-interactive mode and fails with the error
@REM ERROR: The file is either empty or does not contain the valid choices.
@REM @CHOICE /N /C y /D y /T %seconds% > NUL
TIMEOUT  /t %seconds% > NUL



