param (
    [Parameter(Mandatory=$true)]
    [string]$inFile = $argv[0],
    $MaxLength = 210
)
# Define the file path
#$file = "path_to_your_file.txt"

# Read the file content
$content = (Get-Content -Path $infile -Raw) -replace "`r`n", ""

# Define the maximum length of each piece
$maxLength = $MaxLength

# Initialize an empty array to hold the pieces
$pieces = @()

# While there is still content left
while ($content.Length -gt 0) {
    # If the remaining content is shorter than the maximum length
    if ($content.Length -le $maxLength) {
        # Add the remaining content to the pieces array
        $pieces += $content
        # Clear the content
        $content = ""
    } else {
        # Find the last space within the maximum length
        $lastSpace = $content.Substring(0, $maxLength).LastIndexOf(" ")
        # Add the piece up to the last space to the pieces array
        $pieces += $content.Substring(0, $lastSpace)
        # Remove the piece from the content
        $content = $content.Substring($lastSpace + 1)
    }
}

$numPieces = $pieces.Length
$num = 1
foreach ($p in $pieces) {
    if ($num -gt 1) {
        $prefix = ".."
    } else {
        $prefix = ""
    }
    if ($num -lt $numPieces) {
        $suffix = ".."
    } else {
        $suffix = ""
    }

    Write-Output "$($num)/$($numPieces) `"$prefix$p$suffix`""
    $num += 1
}

# Output the pieces
#$pieces
