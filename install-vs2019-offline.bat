@echo off

set vsoDir=e:\vs2019offline
if "%1" neq "" set vsoDir=%~1

echo %~n0: vsoDir=%vsoDir%

pushd "%vsoDir%"
rem .\vs_setup.exe --noWeb --locale en-US --passive --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.Component.HelpViewer --includeRecommended
.\vs_setup.exe --noWeb --locale en-US
popd
