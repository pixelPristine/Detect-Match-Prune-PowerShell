# Paths

$root = "C:\Users\PMLS\Desktop\Random Uni Stuff\New folder\Test Folder"
$listFile = "C:\Users\PMLS\Desktop\Random Uni Stuff\New folder\BaseMod\file_list.txt"

# Load list, trim spaces, normalize slashes
$fileList = Get-Content $listFile | ForEach-Object { $_.Trim() }

foreach ($relPath in $fileList) {
    # Ensure we use backslashes consistently
    $normalized = $relPath -replace '/', '\'

    # Build the full path
    $fullPath = Join-Path $root $normalized

    if (Test-Path -LiteralPath $fullPath) {
        Write-Output "FOUND: $relPath"
    } else {
        Write-Output "MISSING: $relPath"
    }
}