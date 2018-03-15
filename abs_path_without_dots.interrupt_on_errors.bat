

@REM Please, see abs_path_without_dots.emit_errors.bat util for notes.

CALL abs_path_without_dots.emit_errors.bat %*

@IF %ERRORLEVEL% NEQ 0 (
  @ECHO Exit with an error. CMD has ERRORLEVEL = %ERRORLEVEL%.
  @REM We will use the EXIT command to inform any Build-Server with a status of execution (0 means no errors).
  EXIT %ERRORLEVEL%
)


