@ECHO OFF

rem ECHO: & ECHO Please remeber that FIND and FINDSTR do not work with UTF-8 files 


ECHO:
ECHO @ FIND with EN-US codepage
CHCP 437 >NUL
ECHO Result:
TYPE "UTF-8-BOM-text.txt" | FIND "one"


ECHO:&ECHO:
ECHO @ FIND with UTF-8 codepage
CHCP 65001 >NUL
ECHO Result:
TYPE "UTF-8-BOM-text.txt" | FIND "one"


ECHO:&ECHO:
ECHO @ FINDSTR with UTF-8 codepage
CHCP 65001 >NUL
ECHO Result:
TYPE "UTF-8-BOM-text.txt" | FINDSTR "one"
ECHO FYI: FINDSTR may or may not work depending on Windows settings


ECHO:
ECHO:
ECHO Also be aware that a FOR-loop for the results of a command containing
ECHO  FIND or FINDSTR will not work.
ECHO EXAMPLE: FOR /f "tokens=*" %%i IN ('command ^| FIND "bla-bla"')


ECHO:
PAUSE
