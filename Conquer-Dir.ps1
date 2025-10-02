# conquer.ps1
param (
    [string]$TargetPath = "C:\"
)

#Write-Host "Taking ownership of everything under $TargetPath..."
#takeown /F $TargetPath /R /D Y | Out-Null


$me = "$env:USERDOMAIN\$env:USERNAME"
if ("$ENV:MeOverride") {
    $me = $ENV:MeOverride
}
Write-Host "Setting owner of $TargetPath to $me recursively..."
icacls $TargetPath /setowner "$me" /T | Out-Null

Write-Host "Granting $me full control over $TargetPath"
icacls $TargetPath /C /grant $me`:F
#icacls $TargetPath /C /grant $env:USERDOMAIN\$env:USERNAME`:F

#Write-Host "Enabling inheritance..."
#icacls $TargetPath /C /inheritance:e /T | Out-Null


Write-Host "Granting CREATOR OWNER full control (inherited)..."
# NOTE: CREATOR OWNER automatically has (IO) so it applies to files and subfolders but not this folder
icacls $TargetPath /C /grant "CREATOR OWNER:(OI)(CI)F" /T | Out-Null

Write-Host "Done. Files/folders under $TargetPath will now grant full control to their owner."
