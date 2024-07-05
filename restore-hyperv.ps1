param(
    $backupPath = "F:\Backup"
)

reg import "$backupPath\Virtualization.reg"
reg import "$backupPath\vmsmp.reg"
reg import "$backupPath\VMSNPXY.reg"
reg import "$backupPath\VMSNPXYMP.reg"
reg import "$backupPath\VMSP.reg"
reg import "$backupPath\VmsProxy.reg"
reg import "$backupPath\VMSVSF.reg"
reg import "$backupPath\VMSVSP.reg"

foreach ($dir in (Get-ChildItem -Path $backupPath -Directory)) {
   Import-VM -Path "$backupPath\$dir\Virtual Machines\GUID\VMName.xml"
}


