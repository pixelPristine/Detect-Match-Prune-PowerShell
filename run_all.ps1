param(
    [string]$baseRoot,
    [string]$targetRoot
)

function Confirm-And-Run {
    param (
        [string]$message,
        [string]$scriptPath,
        [hashtable]$scriptArgs
    )

    $choice = Read-Host "$message (Y/N)"
    Write-Output $scriptPat
    if ($choice -match '^(Y|y)$') {
        Write-Host ">>> Running $scriptPath ..." -ForegroundColor Green
        & $scriptPath @scriptArgs   # splatting still works
        Write-Host ">>> Finished $scriptPath`n" -ForegroundColor Cyan
    } else {
        Write-Host ">>> Skipped $scriptPath`n" -ForegroundColor Yellow
    }
}

# Ensure both paths exist
if (-not (Test-Path $baseRoot)) { throw "Base root not found: $baseRoot" }
if (-not (Test-Path $targetRoot)) { throw "Target root not found: $targetRoot" }

# Run in sequence
Confirm-And-Run "Run detect_files.ps1?" ".\detect_files.ps1" @{ baseRoot = $baseRoot }
Confirm-And-Run "Run match_files.ps1?"   ".\match_files.ps1"  @{ baseRoot = $baseRoot; targetRoot = $targetRoot }
Confirm-And-Run "Run delete_files.ps1?"  ".\delete_files.ps1" @{ baseRoot = $baseRoot; targetRoot = $targetRoot }
Confirm-And-Run "Run cleanup.ps1?"       ".\cleanup.ps1"      @{ targetRoot = $targetRoot }
