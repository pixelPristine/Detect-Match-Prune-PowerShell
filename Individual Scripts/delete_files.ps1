# Paths

$root = "C:\Users\PMLS\Desktop\Random Uni Stuff\New folder\Test Folder"
$listFile = "C:\Users\PMLS\Desktop\Random Uni Stuff\New folder\BaseMod\file_list.txt"

# Load list, trim spaces, normalize slashes
$fileList = Get-Content $listFile | ForEach-Object { $_.Trim() }

foreach ($relPath in $fileList) {
    $normalized = $relPath -replace '/', '\'
    $fullPath = Join-Path $root $normalized

    if (Test-Path -LiteralPath $fullPath) {
        Write-Output "FOUND (deleting): $relPath"
        Remove-Item -LiteralPath $fullPath -Force
    } else {
        Write-Output "MISSING: $relPath"
    }
}