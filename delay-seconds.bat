@SETLOCAL

@ECHO %~nx0

SET seconds=%1
IF [%seconds%] EQU [] (
    ECHO ERROR! Empty first input parameter.
    EXIT 1001
)

@ECHO Delay for %seconds% seconds.

@REM Non-Interactive process/account troubles.
@REM @CHOICE /N /C y /D y /T %seconds% > NUL
@REM It fails with ERROR: The file is either empty or does not contain the valid choices.
@REM TIMEOUT  /t %seconds% > NUL
@REM It fails with ERROR: Input redirection is not supported, exiting the process immediately.
@REM Workaround: https://stackoverflow.com/questions/1672338/how-to-sleep-for-five-seconds-in-a-batch-file-cmd/33286113#33286113
@REM W32TM /stripchart /computer:localhost /period:%seconds% /Dataonly /samples:2 >nul
@REM 
TypePerf "\System\Processor Queue Length" -si %seconds% -sc 1 >nul



