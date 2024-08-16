@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

if "%1" equ "" goto usage
set scriptName=%~0

@REM change these to desired variable names. each must be unique
@REM NOTE: every instance of the variable in this script must be changed to the new variable name
@REM  To do this in Visual Studio Code select the part of a name you want to change globally then ctrl+shift+L
@REM  which will multi-select every instance of the selected part of a name. Type the new name.
@REM  To exit multi-select mode press ESC.
set param1=
set param2=
set param3=
set param4=
set param5=

FOR /F "tokens=1,2,3,4,5" %%a IN ("%*") DO (
   REM @echo a=%%a b=%%b c=%%c d=%%d e=%%e f=%%f g=%%g h=%%h i=%%i j=%%j 
   REM @echo k=%%k l=%%l m=%%m n=%%n o=%%o p=%%p q=%%q r=%%r s=%%s t=%%t 
   REM @echo u=%%u v=%%v w=%%w x=%%x y=%%y z=%%z
   if "%%a-%%b" NEQ "-" call :label1 %%a %%b
   if "%%c-%%d" NEQ "-" call :label1 %%c %%d
   if "%%e-%%f" NEQ "-" call :label1 %%e %%f
   if "%%g-%%h" NEQ "-" call :label1 %%g %%h
   if "%%i-%%j" NEQ "-" call :label1 %%i %%j
)

echo param1=%param1%
IF "%param2%" NEQ "" echo param2=%param2%
IF "%param3%" NEQ "" echo param3=%param3%
IF "%param4%" NEQ "" echo param4=%param4%
IF "%param5%" NEQ "" echo param5=%param5%

REM Place Custom commands here.

exit /b 0

:label1
REM @echo label1: %%1=%1 %%2=%2
if "%1" EQU "-param1" set param1=%2
if "%1" EQU "-param2" set param2=%2
if "%1" EQU "-param3" set param3=%2
if "%1" EQU "-param4" set param4=%2
if "%1" EQU "-param5" set param5=%2
exit /b 0

:usage
@echo =====
@echo USAGE
@echo =====
@echo %scriptName% -param1 value1 ^[-param2 value2^] ... ^[-paramN valueN^]*
@echo Up to 13 named parameters can be defined. All but the first are optional.
@echo If a parameter is specified then a value for it must be specified.
@echo This example only echoes the parameters that are set. Customize it as needed.
@echo =======
@echo EXAMPLE
@echo =======
@echo %scriptName% -param1 myParameter1Value -param2 myParameter2Value

exit /b 0
