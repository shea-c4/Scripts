@echo off

set vsoDir=d:\vs2022offline
if "%1" neq "" set vsoDir=%~1

echo %~n0: vsoDir=%vsoDir%

pushd "%vsoDir%"
.\vs_setup.exe --layout "%vsoDir%" --lang en-us
popd

