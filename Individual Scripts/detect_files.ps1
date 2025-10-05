# & "C:\Program Files\7-Zip\7z.exe" x "Base Mod.7z"		# For extracting all files from 7z file

$root = "C:\Users\PMLS\Desktop\Random Uni Stuff\New folder\BaseMod"

Get-ChildItem -Path $root -Recurse -File | ForEach-Object {
    # Make path relative
    $rel = $_.FullName.Substring($root.Length + 1)

    # Normalize slashes and trim
    $rel -replace '/', '\' | ForEach-Object { $_.Trim() }
} | Set-Content -Path "$root\file_list.txt" -Encoding UTF8