Get-VMNetworkAdapter -VMName *| ForEach-Object {
   $vmName=$_.VMName
   $switchName=$_.SwitchName
   $macAddr=$_.MacAddress
   $s = "{0} {1} {2}" -f $vmName, $switchName, $macAddr
   write-host $s
   Set-VMNetworkAdapter -VMNetworkAdapter $_ -StaticMacAddress $_.MacAddress
}