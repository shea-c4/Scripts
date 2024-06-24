@ECHO off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

SET VID=%~1
SET MODSIZE=%2
SET SPLITMAX=%3

IF "%VID%" EQU "" (
   @ECHO usage: %~n0 input.mp4 [tiny^|base^|small^|medium^|large] [split-max]
   exit /b 1
)

SET VIDNOEXT=%~n1
SET VIDDIR=%~dp1
SET VIDFQ=%VIDDIR%%~nx1

IF "%MODSIZE%" EQU "" SET MODSIZE=tiny

SET VCMD1=CALL speech2text.bat "%VIDFQ%" %MODSIZE%
@ECHO %~0: Executing %VCMD1%
%VCMD1%

SET SRTPREFIX=%VIDDIR%speech2text\%VIDNOEXT%\%MODSIZE%\%VIDNOEXT%

SET SRT=%SRTPREFIX%.srt
SET VCMD2=CALL ffsrt.bat "%VIDFQ%" "%SRT%"
@ECHO %~0: Executing %VCMD2%
%VCMD2%

SET TXT=%SRTPREFIX%.txt
SET VCMD3=CALL split4x.bat "%TXT%" %SPLITMAX%
@ECHO %~0: Executing %VCMD3%
%VCMD3%
