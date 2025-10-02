@ECHO off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET scriptName=%~nx0

IF "%~1" EQU "" (
   call :usage
   exit /b 1
)

SET input=%~1
SET inputNameOnly=%~n1
SET model=turbo
IF "%~2" NEQ "" SET model=%2
SET splitMax=235
if "%3" NEQ "" set splitMax=%3

REM call %scriptsDir%\transcribe-and-subtitle.bat "%input%" %model% %4 %5 %6 %7 %8 %9
set scriptsDir=%OneDriveConsumer%\scripts
call "%scriptsDir%\transcribe.bat" "%input%" %model% %4 %5 %6 %7 %8 %9

SET srtDir=%OneDriveConsumer%\documents\whisper_transcripts\%~n1\%model%

SET splitCmd=CALL split4x.bat "%srtDir%\%inputNameOnly%.txt" %splitMax%
ECHO %scriptName%: Executing %splitCmd%
%splitCmd%

exit /b %ERRORLEVEL%

:usage
call %scriptsDir%\transcribe-usage.bat %scriptName% %CD%
@REM ECHO  **NOTE** %scriptName% REQUIRES an additional argument, split-max, 
@REM ECHO   BEFORE whisper passthrough args. split-max is the number of characters
@REM ECHO   to split the transcription into before ECHOing to console
exit /b 1
