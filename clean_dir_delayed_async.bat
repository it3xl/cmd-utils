@SETLOCAL

@ECHO.
ECHO %~nx0
@ECHO.

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@CALL "%invokePath%\exit_if_error"

SET executorKey=%~n0-executor

SET deletingPath=%~1
IF ["%deletingPath%"] EQU [""] EXIT 1001

SET delaySeconds=%~2
IF ["%delaySeconds%"] EQU [""] (
  SET delaySeconds=5
)

SET executorHoldingFolder=%~3
IF ["%executorHoldingFolder%"] EQU [""] (
  SET executorHoldingFolder=%LocalAppData%\Temp\%executorKey%
)


IF NOT EXIST "%executorHoldingFolder%" MKDIR "%executorHoldingFolder%"

SET executorFile="%executorHoldingFolder%\%executorKey%-%RANDOM%%RANDOM%.bat"



@ECHO @SETLOCAL>%executorFile%
(
@ECHO:@ECHO OFF
@ECHO:@ECHO:
@ECHO:
@ECHO:ECHO %executorKey%
@ECHO:@ECHO:
@ECHO:
@ECHO:ECHO Deley %delaySeconds% before:
@ECHO:ECHO RD /S /Q "%deletingPath%"
@ECHO:
@ECHO:CHOICE /N /C y /D y /T %delaySeconds% ^> NUL
@ECHO:
@ECHO:RD /S /Q "%deletingPath%"
@ECHO:
@ECHO:EXIT
)>>%executorFile%

START "%executorKey%" %executorFile%


@CALL "%invokePath%\exit_if_error"


ECHO END %~nx0
