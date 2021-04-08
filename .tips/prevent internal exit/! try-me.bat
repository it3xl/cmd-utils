@SET invokePath=%~dp0.
@CD /D %SystemDrive%\
@ECHO OFF

ECHO === Beginninbg of "%~nx0"
ECHO.
ECHO.
ECHO === @ First. We can use 'CMD /C' approach for commands or
ECHO === @  for batch-files that have no parametes or \.\ \..\ in their paths.
ECHO.

ECHO.
CMD /C "%invokePath%\fails.bat"
ECHO === Interanl exit by a fail is prevented.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C "%invokePath%\exit.bat"
ECHO === Interanl exit is prevented.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C "%invokePath%\no-exit.bat"
ECHO === Checking of non-blocking invocation.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO.
ECHO.
ECHO === @ Second. We must use 'CMD /C CALL' approach if
ECHO === @  batch-files that have parametes or \.\ \..\ in their paths.
ECHO.

ECHO.
CMD /C CALL "%invokePath%\fails.bat"
ECHO === Interanl exit by a fail is prevented.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C CALL "%invokePath%\exit.bat"
ECHO === Interanl exit is prevented.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
CMD /C CALL "%invokePath%\no-exit.bat"
ECHO === Checking of non-blocking invocation.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO.
ECHO.
ECHO === @ Third. Let's show how it works with appending of 'START "title" /wait'.
ECHO.


ECHO.
START "Batch-file with faild CMD instructions" /wait CMD /C "%invokePath%\fails.bat"
ECHO === Interanl exit by a fail is prevented.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
START "Batch-file with EXIT 111 command invocation" /wait CMD /C "%invokePath%\exit.bat"
ECHO === Interanl exit is prevented.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
START "Batch-file with EXIT /B 222 command invocation" /wait CMD /C "%invokePath%\no-exit.bat"
ECHO === Checking of non-blocking invocation.
ECHO === ERRORLEVEL is %ERRORLEVEL%

ECHO.
ECHO.
ECHO.
ECHO === End of "%~nx0"
ECHO.

PAUSE
