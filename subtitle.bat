@ECHO off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET inMedia=%~1
SET inSrt=%~pnx2
REM SET inSrt=%inSrt:\=/%
SET OUTFILE=%~3

IF "%inMedia%" EQU "" GOTO usage
IF "%inSrt%" EQU "" GOTO usage
REM IF "%inSrt%" EQU "" SET inSrt=speech2text\%~n1\
IF "%outFile%" EQU "" SET outFile=%~dp1%~n1_srt.mp4

rem SOFT SUBTITLES
SET ffCmd=ffmpeg.exe -y -loglevel warning -i "%inMedia%" -i "%inSrt%" -c copy -c:s mov_text "%outFile%"
ECHO ***EXECUTING***: %ffCmd%
%ffCmd%

endlocal 
exit /b %ERRORLEVEL%

:usage
ECHO %0 input-media input-srt [output-filename]
ECHO output-filename is optional. input-media_srt.mp4 is the default
EXIT /b 1
