param(
    [string]$targetRoot,
    [string]$baseRoot
)

$listFile = Join-Path $baseRoot "file_list.txt"
$fileList = Get-Content $listFile | ForEach-Object { $_.Trim() }

foreach ($relPath in $fileList) {
    $normalized = $relPath -replace '/', '\'
    $fullPath = Join-Path $targetRoot $normalized

    if (Test-Path -LiteralPath $fullPath) {
        Write-Output "FOUND: $relPath"
    } else {
        Write-Output "MISSING: $relPath"
    }
}
