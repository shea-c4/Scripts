<# 
.SYNOPSIS
    This script takes an assembly file path as input and lists its referenced assemblies.
.DESCRIPTION
    The script loads a .NET assembly using the ReflectionOnlyLoadFrom method 
    and retrieves all the assemblies that the input assembly references.

.PARAMETER AssemblyPath
    The full path to the .NET assembly (.dll) whose references need to be inspected.

.EXAMPLE
    .\Get-AssemblyReferences.ps1 -AssemblyPath "C:\Path\To\YourAssembly.dll"
    This will output the list of assemblies that `YourAssembly.dll` references.

.NOTES
    The script works with .NET Framework assemblies and requires PowerShell to be run in an environment 
    where .NET Framework is available.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$AssemblyPath
)

# Ensure the file exists
if (-not (Test-Path $AssemblyPath)) {
    Write-Host "Error: The specified assembly path does not exist." -ForegroundColor Red
    exit 1
}

# Load the assembly in reflection-only context
try {
    $assembly = [Reflection.Assembly]::ReflectionOnlyLoadFrom($AssemblyPath)
    Write-Host "Successfully loaded assembly: $AssemblyPath" -ForegroundColor Green
} catch {
    Write-Host "Error: Unable to load assembly. Ensure it is a valid .NET assembly." -ForegroundColor Red
    exit 1
}

# Get and display the referenced assemblies
$referencedAssemblies = $assembly.GetReferencedAssemblies()

if ($referencedAssemblies.Count -eq 0) {
    Write-Host "This assembly has no referenced assemblies."
} else {
    Write-Host "`nReferenced Assemblies:`n" -ForegroundColor Cyan
    foreach ($refAssembly in $referencedAssemblies) {
        Write-Host "$($refAssembly.FullName)"
    }
}
