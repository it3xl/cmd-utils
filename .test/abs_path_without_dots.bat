@REM 
@ECHO OFF

@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ With quotes input.
CALL ..\abs_path_without_dots.emit_errors.bat  "%~dp0..\dummy.txt"
@ECHO For
@ECHO "%~dp0..\dummy.txt"
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ Without quotes input.
CALL ..\abs_path_without_dots.emit_errors.bat  %~dp0..\dummy.txt
@ECHO For
@ECHO %~dp0..\dummy.txt
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ Can work from other directories.
CALL ..\abs_path_without_dots.bat  "%~dp0..\other_file.txt"
@ECHO @ Assertion: ERRORLEVEL must be 0 and is %ERRORLEVEL%
@ECHO For
@ECHO "%~dp0..\other_file.txt"
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ Relative input path behaviour.
SET start_path=%CD%
@ECHO CD at the beginning is & @ECHO %start_path%
@ECHO invoke "CD .."
@CD ..
@ECHO CD now is & @ECHO %CD%
CALL abs_path_without_dots.emit_errors.bat  ..\dummy.txt
@ECHO For
@ECHO ..\dummy.txt
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
CALL abs_path_without_dots.emit_errors.bat  "..\dummy.txt"
@ECHO For
@ECHO "..\dummy.txt"
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
CD %start_path%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ Empty input is an error.
CALL ..\abs_path_without_dots.emit_errors.bat
@ECHO @ Assertion: ERRORLEVEL must be 3001 and is %ERRORLEVEL%
@ECHO For
@ECHO {empty input}
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ Only doubled-quotes input {""} is an error.
CALL ..\abs_path_without_dots.emit_errors.bat ""
@ECHO @ Assertion: ERRORLEVEL must be 3001 and is %ERRORLEVEL%
@ECHO For
@ECHO ""
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ The doubled double-quotes paths are possible: ""path\...\path""!
SET myPath="..\dummy.txt"
CALL ..\abs_path_without_dots.emit_errors.bat  "%myPath%"
@ECHO @ Assertion: ERRORLEVEL must be 0 and is %ERRORLEVEL%
@ECHO For
@ECHO "%myPath%"
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ The "only round brackets" input path is OK - ().
CALL ..\abs_path_without_dots.emit_errors.bat ()
@ECHO @ Assertion: ERRORLEVEL must be 0 and is %ERRORLEVEL%
@ECHO For
@ECHO ()
@ECHO abs_path_without_dots is & @ECHO %abs_path_without_dots%

@ECHO:
@ECHO @@ Difficult UNC path
SET myPath=\\somename.location.company.position\SERVERNAME$\G039458\OPPA\Do It For'_'Me\Some Folder\.\..\Other Folder
CALL ..\abs_path_without_dots.emit_errors.bat  "%myPath%"
@ECHO @ Assertion: ERRORLEVEL must be 0 and is %ERRORLEVEL%
@ECHO For
@ECHO "%myPath%"
@ECHO abs_path_without_dots is & @ECHO "%abs_path_without_dots%"
@CALL REM Suppresses errors.

@ECHO:
@ECHO @@ The direct usage of Loop-workaround for UNC.
@REM Credits: https://stackoverflow.com/questions/1645843/resolve-absolute-path-from-relative-path-and-or-file-name/10018990#10018990
SET myPath=\\somename.location.company.position\SERVERNAME$\G039458\OPPA\Do It For'_'Me\Some Folder\.\..\Other Folder
@ECHO For
@ECHO %myPath%
FOR /F "delims=" %%i IN ("%myPath%") DO ( ECHO The absolute path is & ECHO "%%~fi" )
@CALL REM Suppresses errors.


@ECHO:
PAUSE
