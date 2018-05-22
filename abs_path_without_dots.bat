

@REM Please, see abs_path_without_dots.emit_errors.bat util for notes.

SET invokePath_abs_path_without_dots=%~dp0.
SET invokePath_abs_path_without_dots=%invokePath_abs_path_without_dots:"=%

CALL "%invokePath_abs_path_without_dots%\abs_path_without_dots.interrupt_on_errors.bat" %*

