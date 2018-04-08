


ECHO ! Warning! Spawning a child process!
@REM Warning for automation professionals.
@REM Most likely there will be a silent killing of child processes by you build server.
@REM See [Spawning processes from build](https://wiki.jenkins.io/display/JENKINS/Spawning+processes+from+build)



@REM See comment of "it3xl" in
@REM https://stackoverflow.com/questions/9267278/using-the-dos-start-command-when-passed-arguments-have-quotes/10209273#10209273
START "%~nx0"^
 CMD /C^
 CALL %*

