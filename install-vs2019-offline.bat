@echo off

set vsoDir=d:\vs2019offline
if "%1" neq "" set vsoDir=%~1

echo %~n0: vsoDir=%vsoDir%

pushd "%vsoDir%"
.\vs_setup.exe --noWeb --passive --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.Component.HelpViewer --includeRecommended
popd
