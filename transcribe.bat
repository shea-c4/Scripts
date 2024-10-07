@echo off

setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

IF "%~1" EQU "" goto usage

SET input=%~1
SET model=turbo
IF "%~2" NEQ "" SET model=%2

SET outputDir=speech2text\%~n1\%model%
IF "%~3" NEQ "" SET outputDir=%~3\%~n1\%model%

SET execCmd=whisper.bat --language en --task transcribe --model %model% --fp16 False --output_format all --output_dir "%outputDir%" "%input%"
echo executing %execCmd%
%execCmd%

endlocal
goto :EOF

:usage
echo usage: %0 input [model] [outputDir]
echo input is required
echo model is one of tiny,base,small,medium,large,turbo. default is turbo.
echo outpuDir defaults to speech2text
echo output will be placed in outputDir\input-without-extension\model
echo NOTE: to specify outputDir you must specify model
echo ----------------------------------------------------------------
