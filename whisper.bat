@echo off
setlocal ENABLEDELAYEDEXPANSION
set deviceArgs=--device cuda
@REM IF "%COMPUTERNAME%" EQU "AL" set deviceArgs=--device cuda
rem  
REM set addtlArgs=--fp16 False --word_timestamps True
set wcmd=C:\python39\Scripts\whisper.exe --model_dir "%OneDriveConsumer%\Videos\whisper_models" --language en %deviceArgs% %addtlArgs% %*
@echo executing %wcmd%
%wcmd%
