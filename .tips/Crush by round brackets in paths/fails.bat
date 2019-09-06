@ECHO:
@ECHO @ then the following expression
@ECHO IF 1==1 (  SET x=%%v%%  )
@ECHO:
@ECHO @ will produce some error like
@ECHO:
IF 1==1 (  SET x=%v%  )
@REM
@ECHO @ This message will never be shown!
