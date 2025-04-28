@echo off

set vsoDir=d:\vs2022offline
if "%1" neq "" set vsoDir=%~1

echo %~n0: vsoDir=%vsoDir%

pushd "%vsoDir%"
REM see https://learn.microsoft.com/en-us/visualstudio/install/workload-and-component-ids?view=vs-2019 for workload IDs
.\vs_setup.exe --noWeb --passive --add Microsoft.VisualStudio.Workload.ManagedDesktop --add Microsoft.VisualStudio.Workload.NetWeb --add Microsoft.Component.HelpViewer --includeRecommended
popd
