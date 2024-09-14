<#
.SYNOPSIS
    Runs chkdsk /scan on every drive.

.DESCRIPTION
    This script iterates through all drives on the system and runs chkdsk /scan on each one to check for errors.

.EXAMPLE
    .\RunChkDsk.ps1
    Runs chkdsk /scan on all drives on the system.
#>
$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)
$log = "${scriptName}: $(get-date) Starting..."
Write-Host $log -ForegroundColor Green

New-EventLog -LogName Application -Source $scriptName
Write-EventLog -LogName Application -Source $scriptName -EventId 1000 -EntryType Information -Message $log

# Get a list of all drives
$drives = Get-WmiObject -Query "SELECT * FROM Win32_LogicalDisk WHERE DriveType=3"
$errorDrives = @()
foreach ($drive in $drives) {
    $driveLetter = $drive.DeviceID
    Write-Host "${scriptName}: Running chkdsk /scan /perf on $driveLetter"
    chkdsk $driveLetter /scan /perf
    if (!$?) {
      $errorDrives += $driveLetter
    }
}

if ($errorDrives.Length) {
   $log = "${scriptName}: $(get-date) chkdsk indicated errors for the following drives: $errorDrives"
   Write-Error $log
   Write-EventLog -LogName Application -Source $scriptName -EventId 1000 -EntryType Error -Message $log
   Exit 1
} else {
   $log = "${scriptName}: $(get-date) Finished. Exiting"
   Write-Host $log -ForegroundColor Green
   Write-EventLog -LogName Application -Source $scriptName -EventId 1000 -EntryType Information -Message $log
}
