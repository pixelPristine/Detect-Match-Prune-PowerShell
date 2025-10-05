# Detect-Match-Prune-PowerShell
A PowerShell Script to detect files in one directory and match (and optionally delete) them in another directory

# Detailed Explanation
- The "run_all.ps1" is the driver script; it takes two paths as input, "base" and "root" which lead (presumably) to folders/directories containing files.
- The driver then calls the "detect_files.ps1" script passing the path to the base folder. The script then scans all files within and stores their paths, relative to the base folder as the root in  "files_list.txt" file.
- After asking for confirmation the driver then executes the "match_files.ps1" passing the path to the target folder and "files_list.txt". The script scans for all entries in the files_list.txt in the target directory using the paths appended to the target folder path.
- Finally, after confirmation from the user, the "delete_files.ps1" is executed. This script is identical to the match_files script aside from having the additional step of deleting each detected file.

I made this script to remove specific files (e.g extracted from an archive) that were placed in an already populated directory with several layers of branching child folders without having to manually locate and delete them.

# Usage
- Place the 4 main script files i.e run_all.ps1, detect_files.ps1, match_files.ps1 and delete_files.ps1 in a single location.
- Open said location in a PowerShell terminal (or just open a terminal and manually navigate to the folder)
- Type **".\run_all.ps1 -baseRoot "path to base folder" -targetRoot "path to target folder"** and hit enter (Replace "path to base folder" and "path to target folder" with the actual paths).
