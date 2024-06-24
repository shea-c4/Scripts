@echo off
REM if pip isn't already installed
REM python -m ensurepip
REM this usually puts pip.exe in c:\python311\Scripts
REM so add C:\python311\Scripts to your path
REM eg set PATH=C:\python311\Scripts;%PATH%
REM

pip install ffmpeg
pip install -U openai-whisper
echo DONT FORGET TO ADD ffmpeg.exe to your path!
echo ONE WAY TO DO THIS IS WINGET: winget install Gyan.FFmpeg
echo then open a new terminal window to get updated PATH

