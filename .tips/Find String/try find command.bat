@SET invokePath=%~dp0.
@CD /D %SystemDrive%\
@ECHO:

SET env_not_local_path=1
ECHO  C:\Program Files\some folder | FIND /C /I "%ProgramW6432%">NUL && SET env_not_local_path=0
ECHO  C:\Program Files\some folder | FIND /C /I "%ProgramFiles%">NUL && SET env_not_local_path=0

@ECHO:
@ECHO env_not_local_path = %env_not_local_path%

PAUSE