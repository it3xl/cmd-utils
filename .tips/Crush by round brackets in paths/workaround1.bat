@ECHO:
@ECHO @ Workaround 1
@ECHO @ Quote an entire expression in the double quotes like this.

IF 1==1 (
  SET "x=%v%"
)
@ECHO @Success! x = %x%


