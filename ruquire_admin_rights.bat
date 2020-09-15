@SETLOCAL

@REM This code block detects if the script is being running with admin PRIVILEGES If it isn't it pauses and then quits.
@REM https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights/8995407#8995407

@SET pause_for_sec=10

@NET SESSION >nul 2>&1
@IF %ERRORLEVEL% NEQ 0 (

    @ECHO:
    @ECHO ######## ########  ########   #######  ########  
    @ECHO ##       ##     ## ##     ## ##     ## ##     ## 
    @ECHO ##       ##     ## ##     ## ##     ## ##     ## 
    @ECHO ######   ########  ########  ##     ## ########  
    @ECHO ##       ##   ##   ##   ##   ##     ## ##   ##   
    @ECHO ##       ##    ##  ##    ##  ##     ## ##    ##  
    @ECHO ######## ##     ## ##     ##  #######  ##     ## 
    @ECHO:
    @ECHO:
    @ECHO ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
    @ECHO This script must be run as administrator to work properly!  
    @ECHO:


 
    @ECHO ...delaying for %pause_for_sec% seconds before EXIT.
    @TypePerf "\System\Processor Queue Length" -si %pause_for_sec% -sc 1 >nul


    @EXIT 1
)

