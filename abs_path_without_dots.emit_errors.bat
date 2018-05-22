
@REM Results:
@REM abs_path_without_dots
@REM  - global variable that contains an absolute path without dots (without a relative reference).


@REM UNC paths are supported.
@REM ! Warning! Double quotes will be stripped out: ""path/path/path""


@REM Warning! This solution removes quotes from any input path.
 

@REM Usage:

@REM #1 To remove dots from a fully-qualified (absolute) path with dots (with a relative reference https://stackoverflow.com/a/3670775).
@REM An example 
@REM "C:\a\b\..\c.txt" -> "C:\a\c.txt"

@REM #2 To convert a relative path to an absolute path related to the CD (the current working directory).
@REM An example 
@REM for a "C:\a\b\" current working directory
@REM "..\c.txt" -> "C:\a\c.txt"



@REM Set a dummy path in abs_path_without_dots global variable to prevent dangerous unchanged or empty values.
SET abs_path_without_dots=%SystemDrive%\error\cmd-util\abs_path_without_dots


SET _raw_input_path="%1"
SET _raw_input_path="%_raw_input_path:"=%"
@ECHO ERRORLEVEL is %ERRORLEVEL%
IF [x%_raw_input_path%] EQU [x""] (
  ECHO ERROR! Input path is empty!
  
  EXIT /B 3001
)
@ECHO ERRORLEVEL is %ERRORLEVEL%


@REM The symbol % was doubled below to prevent slow executions for real UNC paths, even under the REM command.
@REM
@REM The approach with "%%~dpnx1" emits ERRORLEVEL = 1 for unknown reasons (rare cases)
@REM That possibly related to network troubles.
@REM Trying to use the "FRO /F" approach.
@REM
@REM Credits: https://stackoverflow.com/questions/1645843/resolve-absolute-path-from-relative-path-and-or-file-name/3480484#3480484
@REM
@REM @ECHO ERRORLEVEL is %ERRORLEVEL%
@REM SET abs_path_without_dots=%%~dpnx1
@REM @ECHO ERRORLEVEL is %ERRORLEVEL%

@REM Credits: https://stackoverflow.com/questions/1645843/resolve-absolute-path-from-relative-path-and-or-file-name/10018990#10018990
@REM 
@ECHO ERRORLEVEL is %ERRORLEVEL%
FOR /F "delims=" %%i IN (%_raw_input_path%) DO (
  SET abs_path_without_dots=%%~fi
)
@ECHO ERRORLEVEL is %ERRORLEVEL%

