@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

IF "%~1" EQU "" goto usage
IF "%~2" EQU "" goto usage

SET s2tLang=%~1
SET s2tInput=%~2
SET s2tModel=tiny
IF "%~3" NEQ "" SET s2tModel=%3

SET s2tOutputDir=speech2text\%~n2\%s2tModel%
IF "%~4" NEQ "" SET s2tOutputDir=%~4\%~n2\%s2tModel%

SET s2tCmd=whisper.bat --language %s2tLang% --task translate --model %s2tModel% --output_dir "%s2tOutputDir%" "%s2tInput%"
echo executing %s2tCmd%
%s2tCmd%

endlocal
goto :EOF

:usage
echo usage: %0 language input [model] [outputDir]
echo language and input are required
echo language is Spanish, Japanese, ... mis-spellings will show help
echo model is one of tiny,base,small,medium,large. default is tiny.
echo outpuDir defaults to speech2text
echo output will be placed in outputDir\input-without-extension\model
echo NOTE: to specify outputDir you must specify model
echo ----------------------------------------------------------------
