@REM
@ECHO OFF

SET some_value=@@ Some messagae.

ECHO %some_value% With a new line.


@REM "To ECHO text without including a CR/LF" https://ss64.com/nt/echo.html
<NUL (SET /P _dummy_echo_variable=%some_value% Without a new line.)
CALL REM Suppresses previous errors.
<NUL (SET /P _dummy_echo_variable=%some_value% Without a new line.)
CALL REM Suppresses previous errors.


ECHO: & ECHO: & ECHO:

PAUSE