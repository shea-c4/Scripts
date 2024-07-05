# Get all logical drives
$drives = Get-WmiObject -Class Win32_LogicalDisk -Filter "DriveType = 3"

# Initialize total free space variable
$totalFreeSpace = 0

# Loop through each drive and calculate the total free space
foreach ($drive in $drives) {
   $gb = [math]::round($drive.FreeSpace / 1GB, 2)
   Write-Host "$($drive.VolumeName) [$($drive.DeviceID)] free: $gb GB"
   $totalFreeSpace += $drive.FreeSpace
}

# Convert the total free space from bytes to gigabytes for readability
$totalFreeSpaceGB = [math]::round($totalFreeSpace / 1GB, 2)

# Output the total free space in gigabytes
Write-Host "Total Free Space on all drives: $totalFreeSpaceGB GB" -ForegroundColor Green