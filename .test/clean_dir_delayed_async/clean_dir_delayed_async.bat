@SETLOCAL


CD %SYSTEMDRIVE%\

SET invokePath=%~dp0.
@REM The CALL preserves quotes for ~dp0. Prevents problems "Extra quotes inside a path" if this file invoked with a path with quotes.
SET invokePath=%invokePath:"=%

SET folder_to_del=%invokePath%\test.to_delete_dir.%RANDOM%%
IF NOT EXIST "%folder_to_del%"  MKDIR "%folder_to_del%"

SET file_to_del=%folder_to_del%\dummy.%RANDOM%.txt%
ECHO:%file_to_del%> "%file_to_del%"

CALL "%invokePath%\..\..\clean_dir_delayed_async.bat"  "%folder_to_del%" 10


REM PAUSE