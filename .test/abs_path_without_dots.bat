@REM 
@ECHO OFF


@ECHO.
@CALL REM Suppresses previous errors.
@ECHO  @ With quotes input.
CALL ..\abs_path_without_dots.emit_errors.bat  "%~dp0..\dummy.txt"
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@CALL REM Suppresses previous errors.
@ECHO  @ Without quotes input.
CALL ..\abs_path_without_dots.emit_errors.bat  %~dp0..\dummy.txt
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@ECHO  @ Relative input path behaviour.
SET start_path=%CD%
@ECHO CD at the beginning is %start_path%
@ECHO invoke "CD .."
@CD ..
@ECHO CD now is %CD%
@ECHO using of ..\dummy.txt as an input
CALL abs_path_without_dots.emit_errors.bat  ..\dummy.txt
@ECHO abs_path_without_dots = %abs_path_without_dots%
@ECHO using of "..\dummy.txt" as an input
CALL abs_path_without_dots.emit_errors.bat  "..\dummy.txt"
@ECHO abs_path_without_dots = %abs_path_without_dots%
CD %start_path%

@ECHO.
@CALL REM Suppresses previous errors.
@ECHO  @ Empty input is an error.
CALL ..\abs_path_without_dots.emit_errors.bat
@ECHO Assertion: ERRORLEVEL must be 3001 and is %ERRORLEVEL%
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@CALL REM Suppresses previous errors.
@ECHO  @ Only doubled-quotes input {""} is an error.
CALL ..\abs_path_without_dots.emit_errors.bat ""
@ECHO Assertion: ERRORLEVEL must be 3002 and is %ERRORLEVEL%
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@CALL REM Suppresses any errors.
@ECHO  @ The dobuled double-quotes paths is an error - ""path\...\path""!
SET myPath="..\dummy.txt"
CALL ..\abs_path_without_dots.emit_errors.bat  "%myPath%"
@ECHO Assertion: ERRORLEVEL must be 3003 and is %ERRORLEVEL%
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@CALL REM Suppresses previous errors.
@ECHO  @ The "only round brackets" input path is OK - ().
CALL ..\abs_path_without_dots.emit_errors.bat ()
@ECHO Assertion: ERRORLEVEL must be 0 and is %ERRORLEVEL%
@ECHO abs_path_without_dots = %abs_path_without_dots%

@ECHO.
@ECHO.
@ECHO  @ Don't forget to use the Loop-workaround, sometime.
@REM Credits: https://stackoverflow.com/questions/1645843/resolve-absolute-path-from-relative-path-and-or-file-name/10018990#10018990
FOR /F %%i IN ("%~dp0..\dummy.txt") DO ( ECHO The absolute path for & ECHO "%~dp0..\dummy.txt" & ECHO is %%~fi )


@ECHO.
PAUSE
