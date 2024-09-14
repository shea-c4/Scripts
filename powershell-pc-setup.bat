@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

@ECHO EXECUTION POLICY MUST BE SET TO SOMETHING OTHER THAN AllSigned FOR THIS
@ECHO SCRIPT TO WORK. e.g. Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

SET oneDriveWinPowerShellProfile=%OneDriveConsumer%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

SET userDocsFolder=%UserProfile%\Documents
SET userWinPowerShellProfile=%userDocsFolder%\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
IF NOT EXIST "%userDocsFolder%\WindowsPowerShell" mkdir "%userDocsFolder%\WindowsPowerShell"
IF NOT EXIST "%userWinPowerShellProfile%" (
   mklink "%userWinPowerShellProfile%" "%oneDriveWinPowerShellProfile%"
)

SET userPowerShellProfile=%userDocsFolder%\PowerShell\Profile.ps1
IF NOT EXIST "%userDocsFolder%\PowerShell" mkdir "%userDocsFolder%\PowerShell"
IF NOT EXIST "%userPowerShellProfile%" (
   mklink  "%userPowerShellProfile%" "%oneDriveWinPowerShellProfile%"
)

EXIT /b 0
