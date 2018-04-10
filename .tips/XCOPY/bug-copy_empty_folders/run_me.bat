@SETLOCAL

@REM 
@ECHO OFF

CD %SYSTEMDRIVE%\

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@ECHO:

SET result_fixed=%invokePath%\result_fixed
SET result_with_bug=%invokePath%\result_with_bug

SET file_to_copy_1="%invokePath%\source_to_copy\file_to_copy_1.txt"
SET file_to_copy_2="%invokePath%\file_to_copy_2.txt"


RD /S /Q "%result_fixed%" 2>NUL
MKDIR "%result_fixed%"
RD /S /Q "%result_with_bug%" 2>NUL
MKDIR "%result_with_bug%"



@ECHO:
@ECHO Correct copying.
@ECHO:
@ECHO XCOPY  "%file_to_copy_1%"  "%result_fixed%\"  /I /Y
XCOPY  "%file_to_copy_1%"  "%result_fixed%\"  /I /Y

@ECHO:

@ECHO:
@ECHO Copying with an empty file structure because of /E switcher.
@ECHO:
@ECHO XCOPY  "%file_to_copy_1%"  "%result_with_bug%\"  /E /I /Y
XCOPY  "%file_to_copy_1%"  "%result_with_bug%\"  /E /I /Y



@ECHO:
@ECHO:
PAUSE
