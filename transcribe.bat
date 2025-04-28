@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET scriptName=%~nx0

IF "%~1" EQU "" (
    call :usage
    exit /b 1
)

SET input=%~1
SET inputNameOnly=%~n1
SET model=turbo
IF "%2" NEQ "" SET model=%2

SET srtDir=%CD%\speech2text\%inputNameOnly%\%model%

SET whisperCmd=whisper.bat --model %model% --output_dir "%srtDir%" "%input%" %3 %4 %5 %6 %7 %8 %9
echo executing %whisperCmd%
%whisperCmd%

exit /b %ERRORLEVEL%

:usage
call %scriptsDir%\transcribe-usage.bat %~nx0 %CD%
exit /b 1
