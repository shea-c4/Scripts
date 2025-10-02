@echo off
setlocal ENABLEDELAYEDEXPANSION
set deviceArgs=--device cuda
@REM IF "%COMPUTERNAME%" EQU "AL" set deviceArgs=--device cuda
rem  
rem set addtlArgs=--fp16 True --word_timestamps True
REM set addtlArgs=--compression_ratio_threshold 2.4 --logprob_threshold -1.0 --no_speech_threshold 0.6

@REM set whisper_cmd=C:\python39\Scripts\whisper.exe
set whisper_cmd=whisper.exe

set wcmd=%whisper_cmd% %deviceArgs% %addtlArgs% %*
@echo executing %wcmd%
%wcmd%
