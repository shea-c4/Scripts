@echo off
@REM setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
REM 8/18/2024 whisper.exe requires "(Latest) tools build x64/x86 C++ 2022 VS - v143MSVC"
REM which can be installed via the visual studio installer
REM the following doesn't work but interactively installing it seems to
REM call :runcmd choco install visualstudio2022buildtools

REM  install choco first
call :runcmd winget install --id Chocolatey.Chocolatey --scope machine
set PATH=C:\ProgramData\chocolatey\bin;%PATH%

call :runcmd winget install --id Python.Python.3.9 --location c:\python39
REM set PATH=C:\python39\Scripts\;C:\python39\;%PATH%
REM choco includes refreshenv
call refreshenv

REM if pip isn't already installed
rem python -m ensurepip
call :runcmd python -m pip install --upgrade pip
call refreshenv

REM ffmpeg-full didn't seem to work for whisper...
call :runcmd choco install -y ffmpeg
call refreshenv

call :runcmd pip3 install torch --index-url https://download.pytorch.org/whl/cu126 --no-cache-dir --force
call :runcmd pip3 install torchaudio --index-url https://download.pytorch.org/whl/cu126 --no-cache-dir --force

call :runcmd python -m pip install numpy==1.26.4 openai-whisper --no-input --no-cache-dir --force
call refreshenv

@REM echo DONT FORGET TO UPDATE PATH
@REM echo %PATH%

exit /b 0

:runcmd
echo Executing %*
%*



@REM if "%ERRORLEVEL%" NEQ "0" (
@REM    echo ERROR: ERRORLEVEL=%ERRORLEVEL% executing %*
@REM    exit %ERRORLEVEL%
@REM )
goto :eof

@REM :findtarget is not currently used. idea was to detect if file.exe in PATH
:findtarget
echo findtarget %1
set findtarget=%~dp$PATH:1
echo set findtarget=%findtarget%
goto :eof
