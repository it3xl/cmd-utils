@SETLOCAL

CALL %q_env_cmd_util%\exit_if_error

@ECHO.
ECHO Starting %~nx0
@ECHO.

SET executorKey=%~n0-executor

SET deletingPath=%~1
IF ["%deletingPath%"] EQU [""] EXIT 1001

SET executorHoldingFolder=%~2
IF ["%executorHoldingFolder%"] EQU [""] (
  SET executorHoldingFolder=%LocalAppData%\Temp\%executorKey%
)
SET delaySeconds=%~3
IF ["%delaySeconds%"] EQU [""] (
  SET delaySeconds = 5
)


IF NOT EXIST "%executorHoldingFolder%" MKDIR "%executorHoldingFolder%"

SET executorFile="%executorHoldingFolder%\%executorKey%-%RANDOM%%RANDOM%"



@ECHO @SETLOCAL>%executorFile%
(
@ECHO @ECHO OFF
@ECHO.
@ECHO %executorKey%
@ECHO.
@ECHO @ECHO Deley 5 seconds to allow a runer to finish.
@ECHO @CHOICE /N /C y /D y /T %delaySeconds% ^> NUL
@ECHO.
@ECHO RD /S /Q "%deletingPath%"
@ECHO.
@ECHO EXIT
)>>%executorFile%

START "%executorKey%" %executorFile%


CALL %q_env_cmd_util%\exit_if_error