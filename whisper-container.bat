@echo off

set wcmd=docker run -it -v %CD%:/app -v %OneDriveConsumer%\videos\whisper_models:/root/.cache/whisper openai-whisper whisper --fp16 False %*
@echo executing %wcmd%
%wcmd%
