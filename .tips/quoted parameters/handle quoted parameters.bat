@SETLOCAL

@ECHO:&ECHO:

SET invokePath=%~dp0.
@ECHO %invokePath%

@ECHO:&ECHO:

SET quoted_var_1=%1
@ECHO ~%quoted_var_1%~
SET quoted_var_2=%2
@ECHO ~%quoted_var_2%~
SET quoted_var_3=%3
@ECHO ~%quoted_var_3%~

@ECHO:&ECHO:

SET var_1=%~1
@ECHO ~%var_1%~
SET var_2=%~2
@ECHO ~%var_2%~
SET var_3=%~3
@ECHO ~%var_3%~

@ECHO:&ECHO:

