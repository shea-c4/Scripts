@ECHO off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET inMedia=%~1
SET inSpeedup=%2
SET outFile=%~3

IF "%inMedia%" EQU "" GOTO usage
IF "%inSpeedup%" EQU "" GOTO usage
IF "%outFile%" EQU "" SET outFile=%~dp1%~n1_spedup%inSpeedup:.=_%.mp4

REM ffmpeg can be installed via: winget install Gyan.FFmpeg
SET ffCmd=ffmpeg.exe -i "%inMedia%" -vf "setpts=(1/%inSpeedup%)*PTS" -af "atempo=%inSpeedup%" "%outFile%"
ECHO ***EXECUTING***: %ffCmd%
%ffCmd%

exit /b %ERRORLEVEL%

:usage
ECHO %0 input-media speedup [output-filename]
ECHO speedup goes from 0.5 to 100 see ffmpeg atempo filter
ECHO output-filename is optional. input-media_spedup.mp4 is the default
EXIT /b 1


