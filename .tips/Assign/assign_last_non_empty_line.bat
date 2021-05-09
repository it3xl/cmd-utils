@ECHO OFF

ECHO:
ECHO @ EN-US codepage
CHCP 437
CALL :my_func

ECHO:
ECHO @ UTF-8 codepage
CHCP 65001
CALL :my_func

ECHO:
PAUSE

REM GOTO:EOF alternative; https://ss64.com/nt/goto.html
EXIT /B


:my_func
REM https://ss64.com/nt/syntax-functions.html
SETLOCAL
SET My_Num=

(
	FOR /f "tokens=*" %%i IN ('TYPE "UTF-8-BOM-text.txt"') do (
		ECHO line: %%i
		SET My_Num=%%i
	)
)

IF ["%My_Num%"] NEQ [""] (
	ECHO Assigned value is: %My_Num%
) ELSE (
    ECHO  !!!
	ECHO ERROR! Value is empty%My_Num%
)

ENDLOCAL & SET _result=%My_Num%
REM GOTO:EOF alternative; https://ss64.com/nt/goto.html
EXIT /B