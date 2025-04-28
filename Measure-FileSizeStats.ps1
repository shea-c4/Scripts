param (
    [string[]]$Paths = @("C:\", "D:\", "E:\")
)

# Validate paths
$validPaths = $Paths | Where-Object { Test-Path $_ -PathType Container }
if ($validPaths.Count -eq 0) {
    Write-Host "Error: None of the specified paths exist or are directories."
    exit
}

Write-Host "Step 1: Collecting all files from directories: $($validPaths -join ', ')"

# Check if parallel processing is available
if ($PSVersionTable.PSVersion.Major -ge 7) {
    Write-Host "Using parallel processing (PowerShell 7+)."
    # Use parallel processing
    $fileSizes = $validPaths | ForEach-Object -Parallel {
        Get-ChildItem -Path $_ -File -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Length
    } -ThrottleLimit 4
} else {
    Write-Host "Using parallel processing with background jobs (PowerShell 5.1)."
    # Use background jobs for parallel processing
    $jobs = @()
    foreach ($path in $validPaths) {
        $jobs += Start-Job -ScriptBlock {
            param ($Path)
            Get-ChildItem -Path $Path -File -Recurse -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Length
        } -ArgumentList $path
    }

    # Wait for all jobs to complete
    $jobs | ForEach-Object { $_ | Wait-Job }

    # Collect results from jobs
    $fileSizes = $jobs | ForEach-Object { Receive-Job -Job $_ } | Where-Object { $_ -ne $null }

    # Clean up jobs
    $jobs | ForEach-Object { Remove-Job -Job $_ }
}

# Combine results
$fileSizes = $fileSizes | Where-Object { $_ -ne $null }

# Check if any files were found
if (-not $fileSizes -or $fileSizes.Count -eq 0) {
    Write-Host "No files found in the specified directories."
    exit
}

Write-Host "Step 2: Calculating total number of files (including zero-sized files)"
$totalFiles = $fileSizes.Count
Write-Host "Total number of files (including zero-sized files): $totalFiles"

Write-Host "Step 3: Calculating total number of files (excluding zero-sized files)"
$nonZeroSizes = $fileSizes | Where-Object { $_ -gt 0 }
$totalNonZeroFiles = $nonZeroSizes.Count
Write-Host "Total number of files (excluding zero-sized files): $totalNonZeroFiles"

Write-Host "Step 4: Calculating mean file size"
$mean = ($fileSizes | Measure-Object -Average).Average
Write-Host "Mean file size: $mean bytes"

Write-Host "Step 5: Calculating mode file size"
$mode = $fileSizes | Group-Object | Sort-Object Count -Descending | Select-Object -First 1 -ExpandProperty Name
Write-Host "Mode file size: $mode bytes"

Write-Host "Step 6: Calculating median file size (including zero-sized files)"
$sortedSizes = $fileSizes | Sort-Object
$count = $sortedSizes.Count
if ($count % 2 -eq 0) {
    $medianIncludingZero = ($sortedSizes[$count / 2 - 1] + $sortedSizes[$count / 2]) / 2
} else {
    $medianIncludingZero = $sortedSizes[($count - 1) / 2]
}
Write-Host "Median file size (including zero-sized files): $medianIncludingZero bytes"

Write-Host "Step 7: Calculating median file size (excluding zero-sized files)"
if ($totalNonZeroFiles -gt 0) {
    $sortedNonZeroSizes = $nonZeroSizes | Sort-Object
    $countNonZero = $sortedNonZeroSizes.Count
    if ($countNonZero % 2 -eq 0) {
        $medianExcludingZero = ($sortedNonZeroSizes[$countNonZero / 2 - 1] + $sortedNonZeroSizes[$countNonZero / 2]) / 2
    } else {
        $medianExcludingZero = $sortedNonZeroSizes[($countNonZero - 1) / 2]
    }
} else {
    $medianExcludingZero = "No non-zero sized files found"
}
Write-Host "Median file size (excluding zero-sized files): $medianExcludingZero bytes"