

@ECHO.


CALL ..\abs_path_without_dots.bat  "%~dp0..\dummy.txt"
@ECHO.
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@ECHO.
@ECHO.
@ECHO Relative input path behaviour
@ECHO.
@ECHO CD at beginning is
@ECHO %CD%
@ECHO call "CD .."
@CD ..
@ECHO CD now is
@ECHO %CD%
@ECHO.

@ECHO using of "..\dummy.txt" as an input
CALL abs_path_without_dots.bat  ..\dummy.txt
@ECHO.
@ECHO abs_path_without_dots = %abs_path_without_dots%
@ECHO.


pause