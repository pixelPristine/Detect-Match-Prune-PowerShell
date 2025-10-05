$root = "C:\Users\PMLS\Desktop\Random Uni Stuff\New folder\Test Folder"

# Cleanup: delete empty folders (deepest first)
Get-ChildItem -Path $root -Recurse -Directory |
    Sort-Object FullName -Descending |
    ForEach-Object {
        # Use -LiteralPath for actual folder check
        $contents = Get-ChildItem -LiteralPath $_.FullName -Force

        if ($contents.Count -eq 0) {
            Write-Output "Removing empty folder: $($_.FullName)"
            Remove-Item -LiteralPath $_.FullName -Force -Confirm:$false
        } else {
            Write-Output "Skipping non-empty folder: $($_.FullName)"
        }
    }
