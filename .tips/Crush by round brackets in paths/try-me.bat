@SET invokePath=%~dp0.
@CD /D %SystemDrive%\
@ECHO:
@ECHO @ Be aware of a severe CMD fails by variables that contain the round brackets in its value.
@ECHO @ It crashes CMD if a used expression is located inside of the roud brackets.
@ECHO:
@ECHO @ If we have the following variable
SET v=C:\Program Files (x86)\Some folder
@CMD /C @CALL "%invokePath%\fails.bat"
@CMD /C @CALL "%invokePath%\workaround1.bat"
@CMD /C @CALL "%invokePath%\workaround2.bat"

PAUSE