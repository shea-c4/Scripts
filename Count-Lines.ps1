<#
.SYNOPSIS
    This script counts the number of lines in a specified file.

.DESCRIPTION
    The script takes the path to a file as input, reads the contents of the file,
    and counts the number of lines using the Measure-Object cmdlet.

.PARAMETER FilePath
    The full path to the file whose lines you want to count.

.EXAMPLE
    .\Count-Lines.ps1 -FilePath "C:\Path\To\YourFile.txt"
    This will output the number of lines in `YourFile.txt`.

.NOTES
    The script will only work with text-based files and will fail if the file does not exist.
#>

param (
    [Parameter(Mandatory = $true)]
    [string]$FilePath
)

# Ensure the file exists
if (-not (Test-Path $FilePath)) {
    Write-Host "Error: The specified file does not exist." -ForegroundColor Red
    exit 1
}

# Count the number of lines in the file
try {
    $lineCount = (Get-Content $FilePath | Measure-Object -Line).Lines
    Write-Host "The file '$FilePath' contains $lineCount lines." -ForegroundColor Green
} catch {
    Write-Host "Error: Unable to read the file. Ensure it is a valid text-based file." -ForegroundColor Red
}
