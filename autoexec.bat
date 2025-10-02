@ECHO OFF

SET scriptName=%~nx0
SETLOCAL

ECHO ^[%scriptName%^]: BEGIN

SET scriptDir=%~dp0

ECHO ^[%scriptName%^]: Initializing doskey macros
@REM doskey savehist=doskey /history $g$g "%scriptDir%doskey_history.txt"
@REM doskey showhist=type "%scriptDir%doskey_history.txt"
doskey /MACROFILE="%scriptDir%\doskey_macros.txt"
REM doskey /macros

ENDLOCAL

SET promptName=%USERNAME%
if "%USERDOMAIN%" NEQ "%COMPUTERNAME%" SET promptName=%USERNAME%@%USERDOMAIN%
SET promptCmd=PROMPT ^[%promptName% on %COMPUTERNAME%^] $D $T $P$+$G
ECHO ^[%scriptName%^]: Executing %promptCmd%
%promptCmd%

SET scriptsDir=%~dp0
ECHO ^[%scriptName%^]: Exported scriptsDir=%scriptsDir% to environment

call %scriptsDir%\initconda.bat

SET QT_SCALE_FACTOR=1.25
echo ^[%scriptName%^]: set QT_SCALE_FACTOR to %QT_SCALE_FACTOR%

echo.
@REM echo .

@REM call :updatepath "%ProgramFiles%\Notepad++"
@REM echo .

@REM call :updatepath "%ProgramFiles%\Microsoft VS Code"

ECHO ^[%scriptName%^]: END
goto :eof


:updatepath
set target=%~1
IF EXIST "%target%" (
   @REM echo ^[%scriptName%^]: Checking PATH for %target%
   set chkpath="%PATH:Notepad++=%"
   IF "%PATH%" EQU "%chkpath%" (
      @REM echo ^[%scriptName%^]: PATH has %target%
   ) else (
      echo ^[%scriptName%^]: adding to PATH: %target%
      PATH=%target%;%PATH%
   )
   goto :eof
 )
 
