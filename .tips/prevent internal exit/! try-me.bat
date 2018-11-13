@SET invokePath=%~dp0.
@CD /D %SystemDrive%\
@ECHO OFF

ECHO ====== Beginninbg of "%~nx0"
ECHO.
ECHO.
ECHO ====== @ First, we will use 'CMD /C  command_or_batch' approach.
ECHO.

ECHO.
CMD /C "%invokePath%\fails.bat"
ECHO ====== Interanl exit by a fail is prevented.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C "%invokePath%\exit.bat"
ECHO ====== Interanl exit is prevented.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C "%invokePath%\no-exit.bat"
ECHO ====== Checking of non-blocking invocation.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO.
ECHO.
ECHO ====== @ Second, we will use 'CMD /C CALL  command_or_batch' approach.
ECHO.

ECHO.
CMD /C CALL "%invokePath%\fails.bat"
ECHO ====== Interanl exit by a fail is prevented.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C CALL "%invokePath%\exit.bat"
ECHO ====== Interanl exit is prevented.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C CALL "%invokePath%\no-exit.bat"
ECHO ====== Checking of non-blocking invocation.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO.
ECHO.
ECHO ====== @ Third, we will use 'START "title" /wait CMD /C  command_or_batch' approach.
ECHO.


ECHO.
START "Batch-file with faild CMD instructions" /wait CMD /C "%invokePath%\fails.bat"
ECHO ====== Interanl exit by a fail is prevented.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
START "Batch-file with EXIT 111 command invocation" /wait CMD /C "%invokePath%\exit.bat"
ECHO ====== Interanl exit is prevented.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
START "Batch-file with EXIT /B 222 command invocation" /wait CMD /C "%invokePath%\no-exit.bat"
ECHO ====== Checking of non-blocking invocation.
ECHO ====== ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO.
ECHO.
ECHO ====== End of "%~nx0"
ECHO.

PAUSE
