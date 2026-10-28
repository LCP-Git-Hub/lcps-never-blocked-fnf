param(
    [string]$GamePath = (Join-Path (Split-Path -Parent $PSScriptRoot) 'FNF-LCPS-All-in-One.html')
)
$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'Install the official GitHub CLI from https://cli.github.com/ first.' }
if (-not (Test-Path -LiteralPath $GamePath)) { throw 'Provide the updated game HTML with -GamePath or put it beside this repository folder.' }
$expectedHash = ((Get-Content -LiteralPath 'FNF-LCPS-All-in-One.sha256' -Raw).Trim() -split '\s+')[0]
if ((Get-FileHash -LiteralPath $GamePath -Algorithm SHA256).Hash -ne $expectedHash) { throw 'HTML checksum mismatch. Use the matching updated game HTML and checksum.' }
gh auth status
if ($LASTEXITCODE -ne 0) { throw 'Run gh auth login first.' }
$repoName = 'LCP-Git-Hub/lcps-never-blocked-fnf'
$releaseTag = 'low-memory-2026-10-27'
$permission = gh repo view $repoName --json viewerPermission --jq .viewerPermission
if ($LASTEXITCODE -ne 0 -or $permission -notin @('ADMIN','MAINTAIN','WRITE')) { throw 'The signed-in GitHub account needs write access to the game repository.' }
gh release view $releaseTag --repo $repoName 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
    gh release create $releaseTag --repo $repoName --title 'FNF v0.8.6 - Low-memory Chromebook update' --notes-file RELEASE-NOTES.md --target main --latest
    if ($LASTEXITCODE -ne 0) { throw 'Release creation failed.' }
} else {
    gh release edit $releaseTag --repo $repoName --title 'FNF v0.8.6 - Low-memory Chromebook update' --notes-file RELEASE-NOTES.md --latest
    if ($LASTEXITCODE -ne 0) { throw 'Release notes update failed.' }
}
$namedAsset = $GamePath + '#FNF-LCPS-All-in-One.html'
gh release upload $releaseTag $namedAsset FNF-LCPS-All-in-One.sha256 Low-memory-instructions.txt --repo $repoName --clobber
if ($LASTEXITCODE -ne 0) { throw 'Release asset upload failed.' }
Write-Host "Download page: https://github.com/$repoName/releases/tag/$releaseTag"
