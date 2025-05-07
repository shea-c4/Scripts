<#
.SYNOPSIS
Recursively searches a registry key for values that contain a specified string.

.DESCRIPTION
This script starts from a given registry path and searches recursively through all subkeys.
It looks for string values that contain a specified match string.
Matches are printed to standard output.

Supports PowerShell common parameters: -Verbose, -Debug, etc.

.PARAMETER Path
The root registry path to begin searching (e.g. 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server').

.PARAMETER MatchText
The text to search for within registry value data.

.EXAMPLE
.\Find-RegistryValue.ps1 -Path 'HKLM:\SOFTWARE\Microsoft\Microsoft SQL Server' -MatchText 'c:\sqldevroot'

.EXAMPLE
.\Find-RegistryValue.ps1 -Path 'HKLM:\SOFTWARE' -MatchText 'sql' -InformationAction Continue

.EXAMPLE
.\Find-RegistryValue.ps1 -Path 'HKLM:\SOFTWARE' -MatchText 'sql' -Verbose

#>
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [Parameter(Mandatory = $true)]
    [string]$MatchText
)
Write-Output "Script Starting"
$DebugPreference = 'Continue'

Write-Information "Script invoked with parameters:"
Write-Information " Path=$Path"
Write-Information " MatchText=$MatchText"

function Search-RegistryForValue {
    <#
    .SYNOPSIS
    Recursively searches a registry path for values matching a specified string.

    .DESCRIPTION
    Searches all subkeys of a registry path for string values that contain a specified substring.
    Outputs each match as "Path\ValueName = ValueData".

    .PARAMETER Path
    The registry path to search.

    .PARAMETER MatchText
    The string to search for in registry value data.

    .EXAMPLE
    Search-RegistryForValue -Path 'HKLM:\SOFTWARE\MyApp' -MatchText 'log'

    #>   
   [CmdletBinding()]
    param (
        [string]$Path,
        [string]$MatchText
    )

    Write-Verbose "Checking subkey $Path"
    try {
        $key = Get-Item -Path $Path -ErrorAction Stop
        $values = $key.GetValueNames()

        foreach ($valueName in $values) {
            Write-Debug "Checking value $valueName"
            $valueData = $key.GetValue($valueName)
            if ($valueData -is [string] -and $valueData -like "*$MatchText*") {
                Write-Output "MATCH: $Path\$valueName = $valueData"
            }
        }

        $subKeys = Get-ChildItem -Path $Path -ErrorAction Stop
        foreach ($subKey in $subKeys) {
            Search-RegistryForValue -Path $subKey.PSPath -MatchText $MatchText
        }
    } catch {
        Write-Error "Failed to access ${Path}: $_"
    }
}

Search-RegistryForValue -Path $Path -MatchText $MatchText

Write-Output "Script Finished"
