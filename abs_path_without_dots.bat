

@REM ! WARNING ! UNC paths are not supported.


@REM Results:
@REM abs_path_without_dots
@REM  - global variable that contains an absolute path without dots (without a relative reference).

@REM Warning! This solution removes quotes from any input path.


@REM Usage:

@REM #1 Removes dots from a fully-qualified (absolute) path with dots (with a relative reference https://stackoverflow.com/a/3670775).
@REM An example 
@REM "C:\a\b\..\c.txt" -> "C:\a\c.txt"

@REM #2 Converts a relative path to an absolute path related to CD (current working directory).
@REM An example for "C:\a\b\" current working directory
@REM "..\c.txt" -> "C:\a\c.txt"

@REM Credits: https://stackoverflow.com/questions/1645843/resolve-absolute-path-from-relative-path-and-or-file-name/3480484#3480484

@SET abs_path_without_dots=%~dpnx1





