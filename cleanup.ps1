param(
    [string]$targetRoot
)

# Cleanup: delete empty folders (deepest first)
Get-ChildItem -Path $targetRoot -Recurse -Directory |
    Sort-Object FullName -Descending |
    ForEach-Object {
        $contents = Get-ChildItem -LiteralPath $_.FullName -Force
        if ($contents.Count -eq 0) {
            Write-Output "Removing empty folder: $($_.FullName)"
            Remove-Item -LiteralPath $_.FullName -Force -Confirm:$false
        } else {
            Write-Output "Skipping non-empty folder: $($_.FullName)"
        }
    }
