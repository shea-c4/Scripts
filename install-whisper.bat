@echo off
setlocal
REM 8/18/2024 whisper.exe requires "(Latest) tools build x64/x86 C++ 2022 VS - v143MSVC"
REM which can be installed via the visual studio installer
REM the following doesn't work but interactively installing it seems to
REM call :runcmd choco install visualstudio2022buildtools
REM  install choco first

call :runcmd winget install --id Python.Python.3.9 --location c:\python39
REM choco includes refreshenv
refreshenv

REM setx includes system path in user path, skipping for now
REM setx PATH "%LOCALAPPDATA%\Programs\Python\Python39;%PATH%"
REM set PATH=%LOCALAPPDATA%\Programs\Python\Python39;%LOCALAPPDATA%\Programs\Python\Python39\scripts;%PATH%

REM if pip isn't already installed
rem python -m ensurepip
call :runcmd python -m pip install --upgrade pip
refreshenv

REM ffmpeg-full didn't seem to work for whisper...
call :runcmd choco install ffmpeg
refreshenv

call :runcmd python -m pip install numpy==1.26.4 openai-whisper --no-input --no-cache-dir

echo DONT FORGET TO UPDATE PATH
echo %PATH%

:end0
exit /b %ERRORLEVEL%
:end
exit /b %ERRORLEVEL%

:runcmd
echo Executing %*
%*
if "%ERRORLEVEL%" NEQ "0" (
   echo ERROR: ERRORLEVEL=%ERRORLEVEL% executing %*
   exit %ERRORLEVEL%
)
goto :eof

:findtarget
echo findtarget %1
set findtarget=%~dp$PATH:1
echo set findtarget=%findtarget%
goto :eof

:updatepath
if "%PATH:gyan.ffmpeg.shared_=%" NEQ "%PATH%" goto :eof
echo Prepending PATH with %~dp1
REM setx PATH "%~dp1;%PATH%"
set PATH=%~dp1;%PATH%
goto :eof

