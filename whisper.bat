@echo off

set wcmd=whisper.exe --model_dir "%OneDriveConsumer%\Videos\whisper_models" --language en --fp16 False %*
@echo executing %wcmd%
%wcmd%
