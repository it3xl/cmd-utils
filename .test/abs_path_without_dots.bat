

@ECHO.
@ECHO With quotes
CALL ..\abs_path_without_dots.bat  "%~dp0..\dummy.txt"
@ECHO.
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@ECHO.
@ECHO Without quotes
CALL ..\abs_path_without_dots.bat  %~dp0..\dummy.txt
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


@ECHO.
@ECHO.
@ECHO And don't forget the Loop workaround
@ECHO.
@REM Credits: https://stackoverflow.com/questions/1645843/resolve-absolute-path-from-relative-path-and-or-file-name/10018990#10018990
FOR /F %%i IN ("%~dp0..\dummy.txt") DO ( echo absolute path: %%~fi )
@ECHO.


pause