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
SET promptCmd=PROMPT ^[%COMPUTERNAME%^] $D $T $P$+$G
ECHO ^[%scriptName%^]: Executing %promptCmd%
%promptCmd%

SET scriptsDir=%~dp0
ECHO ^[%scriptName%^]: Exported scriptsDir=%scriptsDir% to environment

ECHO ^[%scriptName%^]: END
