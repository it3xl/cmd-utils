@SET invokePath=%~dp0.
@CD /D %SystemDrive%\


@ECHO:
@ECHO:
@ECHO @ Match.
@ECHO:
SET env_local_path=1
ECHO  C:\Program Files\some folder | FIND /C /I "%ProgramW6432%">NUL && SET env_local_path=0
IF %ERRORLEVEL% EQU 1  CALL REM Suppresses previous errors.
ECHO  C:\Program Files\some folder | FIND /C /I "%ProgramFiles%">NUL && SET env_local_path=0
IF %ERRORLEVEL% EQU 1  CALL REM Suppresses previous errors.

@ECHO:
@ECHO env_local_path = %env_local_path%
@ECHO ERRORLEVEL = %ERRORLEVEL%


@ECHO:
@ECHO:
@ECHO @ Not match.
@ECHO:
SET env_local_path=1
ECHO  C:\oppa\some folder | FIND /C /I "%ProgramW6432%">NUL && SET env_local_path=0
IF %ERRORLEVEL% EQU 1  CALL ECHO Suppresses previous errors.
ECHO  C:\oppa\some folder | FIND /C /I "%ProgramFiles%">NUL && SET env_local_path=0
IF %ERRORLEVEL% EQU 1  CALL ECHO Suppresses previous errors.

@ECHO:
@ECHO env_local_path = %env_local_path%
@ECHO ERRORLEVEL = %ERRORLEVEL%



PAUSE