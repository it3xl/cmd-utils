@SETLOCAL

@ECHO %~nx0

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

@CALL "%invokePath%\exit_if_error"

SET cleanup_skip_newest_amount=%1
IF [%cleanup_skip_newest_amount%] EQU [] EXIT 1001

SET target_cleanup_folder=%2
IF [%target_cleanup_folder%] EQU [] EXIT 1002
IF [%target_cleanup_folder%] EQU [""] EXIT 1002
SET target_cleanup_folder=%target_cleanup_folder:"=%



@REM See comment of "it3xl" in
@REM https://stackoverflow.com/questions/9267278/using-the-dos-start-command-when-passed-arguments-have-quotes/10209273#10209273
START "%~nx0"^
 CMD /C^
 CALL "%invokePath%\cleanup_old_folders.bat"^
 %cleanup_skip_newest_amount%^
 "%target_cleanup_folder%"




@CALL "%invokePath%\exit_if_error"


ECHO End %~nx0
