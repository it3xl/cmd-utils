SETLOCAL

SET invokePath=%~dp0.

CD /D %SYSTEMDRIVE%\

CALL "%invokePath%\handle quoted parameters.bat"  "a a a "  " b b b"  " c c c "

PAUSE