@ECHO:
@ECHO @ Workaround 2
@ECHO @ Forse this variables to store its values inside double quotes like this.
@REM https://stackoverflow.com/questions/2410501/parenthesis-in-windows-cmd-script-variable-values-not-allowed/16894316#16894316
SET v2="%v%"

IF 1==1 (
  SET x="a(b)c"
)
@ECHO @Success! x = %x%
@ECHO:
@ECHO @ Then remove the double quotes when you need it by the following expression
@ECHO SET x=%%x:"=%%
@SET x=%x:"=%
@ECHO @ and we will get the dequoted x = %x%
