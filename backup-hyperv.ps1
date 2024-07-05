param(
    $backupPath = "F:\Backup"
)


$vmList = Get-VM
foreach ($vm in $vmList) {
    $vmName = $vm.Name
    $exportPath = "$backupPath\$vmName"
    Write-Output "Export-VM -Name $vmName -Path -$exportPath"
    Export-VM -Name $vmName -Path $exportPath
}


reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" "$backupPath\Virtualization.reg"

reg export "HKLM\SYSTEM\CurrentControlSet\Services\vmsmp" "$backupPath\vmsmp.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\VMSNPXY" "$backupPath\VMSNPXY.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\VMSNPXYMP" "$backupPath\VMSNPXYMP.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\VMSP" "$backupPath\VMSP.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\VmsProxy" "$backupPath\VmsProxy.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\VMSVSF" "$backupPath\VMSVSF.reg"
reg export "HKLM\SYSTEM\CurrentControlSet\Services\VMSVSP" "$backupPath\VMSVSP.reg"


