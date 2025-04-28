<#
.SYNOPSIS
    Runs chkdsk /scan on every drive.

.DESCRIPTION
    This script iterates through all drives on the system and runs 
    chkdsk /scan on each one to check for errors.

.EXAMPLE
    .\RunChkDsk.ps1
    Runs chkdsk /scan on all drives on the system.
#>
param(
    [switch]$WhatIf,
    [switch]$Repair,
    [string[]]$OnlyDrives = @()
)
Set-StrictMode -Version Latest

$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)

function Write-Log {
    param([string]$Msg, [ConsoleColor]$ForegroundColor)

    Write-EventLog -LogName Application -Source $scriptName -EventId 1000 -EntryType Information -Message $Msg
    $whArgs = @{ Object = $Msg }
    if ($ForegroundColor)
    {
        $whArgs.ForegroundColor = $ForegroundColor        
    }
    Write-Host @whArgs
}

New-EventLog -LogName Application -Source $scriptName -ErrorAction SilentlyContinue

$log = "${scriptName}: $(get-date) Starting WhatIf=$WhatIf Repair=$Repair OnlyDrives=$OnlyDrives"
Write-Log -Msg $log -ForegroundColor Green

#Write-Log -Msg $log

# Get a list of all drives
$drives = Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType=3"
if ($OnlyDrives.Length -gt 0) {
    $drives = $drives | Where-Object { $_.DeviceID[0] -in $OnlyDrives }
}

$filteredDriveLetters = $drives|Select-Object -ExpandProperty DeviceID
Write-Log -Msg "${scriptName}: drives=$filteredDriveLetters"

$errorDrives = @()
foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    $log = "${scriptName}: Checking drive $driveLetter"
    Write-Log -Msg $log -ForegroundColor Green
    $cmd = "chkdsk $driveLetter /scan /perf"
    if ($Repair) {
        $cmd = "chkdsk $driveletter /F /R /V"
    }
    
    if ($WhatIf) {
        Write-Log "${scriptName}: WhatIf mode, skipping cmd=$cmd"
    } else {
        Write-Log "${scriptName}: Executing cmd=$cmd"
        Invoke-Expression $cmd
        if (!$?) {
            $errorDrives += $driveLetter
          }
    }
}

if ($errorDrives.Length) {
   $log = "${scriptName}: $(get-date) chkdsk indicated errors for the following drives: $errorDrives"
   Write-Log -Msg $log -ForegroundColor Red
   Exit 1
} else {
   $log = "${scriptName}: $(get-date) Finished. Exiting"
   Write-Log -Msg $log -ForegroundColor Green
}
