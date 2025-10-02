@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

echo Installing Whisper and dependencies
call :runcmd winget install miniconda3

echo Restart with conda.exe in your path
echo.
echo Then run the following at least once from an administrative powershell prompt:
echo conda init powershell 
echo.
echo The rest can be run from a regular administrative command prompt:
echo %WINDIR%\System32\cmd.exe "/K %USERPROFILE%\miniconda3\Scripts\activate.bat C:\Users\maritime6626\miniconda3"
echo pip3 install torch torchaudio torchvision --index-url https://download.pytorch.org/whl/cu126
echo pip3 install openai-whisper
echo pip3 install install deepmultilingualpunctuation
echo python
echo  from deepmultilingualpunctuation import PunctuationModel
echo  PunctuationModel()  # triggers download


@REM REM  install choco first
@REM echo checking for choco.exe
@REM set haspath=0
@REM call :checkpath choco.exe
@REM if "!haspath!" equ "0" (
@REM   echo installing chocolatey and updating path
@REM   call :runcmd winget install --id Chocolatey.Chocolatey --scope machine
@REM   set PATH=C:\ProgramData\chocolatey\bin;"%PATH%"
@REM ) else (
@REM   echo choco.exe found
@REM )

@REM exit /b 0

@REM REM call :runcmd winget install --id Python.Python.3.9 --location c:\python39
@REM REM set PATH=C:\python39\Scripts\;C:\python39\;%PATH%
@REM REM choco includes refreshenv
@REM REM call refreshenv
@REM rem call :runcmd choco install pyenv-win -y
@REM rem call refreshenv
@REM rem call pyenv install 3.9.13
@REM rem call pyenv global 3.9.13

@REM call :runcmd winget install --id Python.Python.3.10 --location c:\python310
@REM set PATH=C:\python310\Scripts\;C:\python310\;%PATH%

@REM REM if pip isn't already installed
@REM rem python -m ensurepip
@REM call python -m pip install --upgrade pip
@REM REM call refreshenv

@REM REM ffmpeg-full didn't seem to work for whisper...
@REM call choco install -y ffmpeg
@REM @REM call refreshenv

@REM call pip3 install torch torchaudio torchvision --index-url https://download.pytorch.org/whl/cu126
@REM @REM call pip3 install torchaudio --index-url https://download.pytorch.org/whl/cu126 --no-cache-dir --force

@REM REM call python -m pip install numpy==1.26.4 openai-whisper --no-input
@REM call pip3 install openai-whisper --no-input
@REM call refreshenv

@REM @REM echo DONT FORGET TO UPDATE PATH
@REM @REM echo %PATH%

@REM exit /b 0

:runcmd
echo Executing %*
%*
exit /b %ERRORLEVEL%

:checkpath
set haspath=0
if "%~$PATH:1" NEQ "" set haspath=1
exit /b 0
