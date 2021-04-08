@SETLOCAL

@ECHO %~nx0

SET seconds=%1
IF [%seconds%] EQU [] (
    ECHO ERROR! Empty first input parameter.
    EXIT 1001
)

@ECHO Delay for %seconds% seconds.

@REM Non-Interactive process/account troubles.
@REM
@REM @CHOICE /N /C y /D y /T %seconds% > NUL
@REM CHOICE fails with ERROR: The file is either empty or does not contain the valid choices.
@REM Also, it hangs in VSCode.
@REM
@REM TIMEOUT  /t %seconds% > NUL
@REM TIMEOUT fails with an ERROR: Input redirection is not supported, exiting the process immediately.
@REM Workaround: https://stackoverflow.com/questions/1672338/how-to-sleep-for-five-seconds-in-a-batch-file-cmd/33286113#33286113
@REM
@REM W32TM /stripchart /computer:localhost /period:%seconds% /Dataonly /samples:2 > NULL
@REM W32TM is interesting approach but just do not use it for now.
@REM
TypePerf "\System\Processor Queue Length" -si %seconds% -sc 1 >nul



