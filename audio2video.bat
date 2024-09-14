@ECHO off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET VID=%~1
set vidnameonly=%~n1

IF "%VID%" EQU "" (
   @ECHO usage: %~n0 input.m4a
   exit /b 1
)

set filters=-filter_complex "[0:a]showwaves=s=1280x720:mode=line,format=yuv420p[v]"
set map=-map "[v]" -map 0:a
REM commented the following out because they appear to be the default
REM set output_codecs=-c:v libx264 -c:a aac 
ffmpeg -i %VID% %filters% %map% -strict experimental -b:a 192k -shortest %vidnameonly%.mp4
