@REM ECHO OFF

@ECHO %~nx0


IF ["%env_defined_at%"] NEQ [""] EXIT /B;

SET env_cmd_util=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET env_cmd_util=%env_cmd_util:"=%
SET q_env_cmd_util="%env_cmd_util%"



FOR /F %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a

SET env_date=%DTS:~0,4%.%DTS:~4,2%.%DTS:~6,2%
SET env_time=%DTS:~8,2%.%DTS:~10,2%
SET env_time_sec=%DTS:~8,2%.%DTS:~10,2%-%DTS:~12,2%

SET env_defined_at=%env_date% %env_time_sec%

ECHO.
REM ECHO DTS %DTS%
ECHO env_defined_at %env_defined_at%
ECHO.