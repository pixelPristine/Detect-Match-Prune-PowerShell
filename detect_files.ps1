param(
    [string]$baseRoot
)

if (-not $baseRoot) {
    Write-Error "Base root folder was not provided."
    exit 1
}

Write-Output $baseRoot

$outputFile = Join-Path $baseRoot "file_list.txt"

Get-ChildItem -Path $baseRoot -Recurse -File | ForEach-Object {
    # Make path relative
    $rel = $_.FullName.Substring($baseRoot.Length + 1)

    # Normalize slashes and trim
    $rel -replace '/', '\' | ForEach-Object { $_.Trim() }
} | Set-Content -Path $outputFile -Encoding UTF8
