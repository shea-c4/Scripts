@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

IF "%~1" EQU "" goto usage

SET s2tInput=%~1
SET s2tModel=tiny
IF "%~2" NEQ "" SET s2tModel=%2

SET s2tOutputDir=speech2text\%~n1\%s2tModel%
IF "%~3" NEQ "" SET s2tOutputDir=%~3\%~n1\%s2tModel%

SET s2tCmd=whisper.bat --model %s2tModel% --output_dir "%s2tOutputDir%" "%s2tInput%"
echo executing %s2tCmd%
%s2tCmd%

exit /b %ERRORLEVEL%

:usage
echo usage: speech2text input [model] [outputDir]
echo input is required
echo model is one of tiny,base,small,medium,large. default is tiny.
echo outpuDir defaults to speech2text
echo output will be placed in outputDir\input-without-extension\model
echo NOTE: to specify outputDir you must specify model
echo ----------------------------------------------------------------
