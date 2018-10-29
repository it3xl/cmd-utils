@SET invokePath=%~dp0.
@CD /D %SystemDrive%\


@ECHO:
@ECHO:
@ECHO @ Not match. A usage with a target error suppressing.
@ECHO:
SET env_local_path=0
ECHO  C:\oppa\some folder | FIND /C /I "%ProgramW6432%">NUL || ( SET env_local_path=1 & CALL REM Suppresses previous errors. )
ECHO  C:\oppa\some folder | FIND /C /I "%ProgramFiles%">NUL || ( SET env_local_path=1 & CALL REM Suppresses previous errors. )

@ECHO:
@ECHO env_local_path = %env_local_path%
@ECHO ERRORLEVEL = %ERRORLEVEL%


@ECHO:
@ECHO:
@ECHO @ Match. A usage with a target error suppressing.
@ECHO:
SET env_local_path=0
ECHO  C:\Program Files\some folder | FIND /C /I "%ProgramW6432%">NUL || ( SET env_local_path=1 & CALL REM Suppresses previous errors. )
ECHO  C:\Program Files\some folder | FIND /C /I "%ProgramFiles%">NUL || ( SET env_local_path=1 & CALL REM Suppresses previous errors. )

@ECHO:
@ECHO env_local_path = %env_local_path%
@ECHO ERRORLEVEL = %ERRORLEVEL%


@ECHO:
@ECHO:
@ECHO @ Match. A usage with an unsafe error suppressing.
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
@ECHO @ Not match. A usage with an unsafe error suppressing.
@ECHO:
SET env_local_path=1
ECHO  C:\oppa\some folder | FIND /C /I "%ProgramW6432%">NUL && SET env_local_path=0
IF %ERRORLEVEL% EQU 1  CALL REM Suppresses previous errors.
ECHO  C:\oppa\some folder | FIND /C /I "%ProgramFiles%">NUL && SET env_local_path=0
IF %ERRORLEVEL% EQU 1  CALL REM Suppresses previous errors.

@ECHO:
@ECHO env_local_path = %env_local_path%
@ECHO ERRORLEVEL = %ERRORLEVEL%



PAUSE