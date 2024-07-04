@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

IF "%~1" EQU "" goto usage

SET s2tInput=%~1
rem shift

SET s2tModel=tiny
IF "%~2" NEQ "" SET s2tModel=%2
SET s2tOutputDir=speech2text\%~n1\%s2tModel%
rem shift

IF "%~3" NEQ "" SET s2tOutputDir=%~3\%~n1\%s2tModel%
rem shift

rem shift /3
SET s2tCmd=whisper.exe --model %s2tModel% --model_dir "%OneDriveConsumer%\Videos\whisper_models" --language en --fp16 False --output_dir "%s2tOutputDir%" "%s2tInput%" %4 %5 %6 %7 %8 %9
echo executing %s2tCmd%
%s2tCmd%

exit /b %ERRORLEVEL%

:usage
echo usage: speech2text input [model] [outputDir]
echo input is required
echo model is one of tiny,base,small,medium,large,large-v2,large-v3. default is tiny.
echo outpuDir defaults to speech2text
echo output will be placed in outputDir\input-without-extension\model
echo NOTE: to specify outputDir you must specify model
echo ----------------------------------------------------------------
