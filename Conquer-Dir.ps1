# conquer.ps1
param (
    [string]$TargetPath = "C:\"
)

#Write-Host "Taking ownership of everything under $TargetPath..."
#takeown /F $TargetPath /R /D Y | Out-Null

#Write-Host "Setting owner to current user recursively..."
$me = "$env:USERDOMAIN\$env:USERNAME"
icacls $TargetPath /setowner "$me" /T | Out-Null

Write-Host "Granting $me full control over $TargetPath"
#icacls $TargetPath /grant $me:F
icacls $TargetPath /grant $env:USERDOMAIN\$env:USERNAME`:F

#Write-Host "Enabling inheritance..."
#icacls $TargetPath /inheritance:e /T | Out-Null


Write-Host "Granting CREATOR OWNER full control (inherited)..."
# NOTE: CREATOR OWNER automatically has (IO) so it applies to files and subfolders but not this folder
icacls $TargetPath /grant "CREATOR OWNER:(OI)(CI)F" /T | Out-Null

Write-Host "Done. Files/folders under $TargetPath will now grant full control to their owner."
