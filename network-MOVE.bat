@SETLOCAL

@REM We have to use ECHO OFF becase this batch file is invoked from network-MOVE-for-del.bat as a separate process.
@ECHO OFF


@ECHO %~nx0

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@CALL "%invokePath%\exit_if_error"

@REM This logic is much faster than ROBOCOPY! FYI.


SET error_code=0

SET source=%1
IF [%source%] EQU [] SET error_code=1001
IF [%source%] EQU [""] SET error_code=1001

SET target=%2
IF [%target%] EQU [] SET error_code=1002
IF [%target%] EQU [""] SET error_code=1002

@IF %error_code% NEQ 0 (
  @ECHO Exit with %error_code% error.
  EXIT %error_code%
)


@REM We should postpone because win-network bug "Access is denied. 0 dir(s) moved."

@ECHO Attempt #1 of 20
MOVE /Y %source% %target%

IF EXIST %source% (
  @ECHO Attempt #2 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #3 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #4 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #5 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #6 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #7 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #8 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #9 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #10 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #11 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #12 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #13 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #14 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #15 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #16 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #17 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #18 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #19 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)
IF EXIST %source% (
  @ECHO Attempt #20 of 20
  @CALL "%invokePath%\delay-seconds.bat" 3
  MOVE /Y %source% %target%
)



IF EXIST %source% (
  @ECHO Cannot move the folder %source%
  @ECHO Possibly it contains files with long names or it is long itself.
  EXIT 223
)



@CALL "%invokePath%\exit_if_error"


ECHO End %~nx0
