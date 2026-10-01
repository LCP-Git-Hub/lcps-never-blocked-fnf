$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'Install the official GitHub CLI from https://cli.github.com/ first.' }
$gamePath = Join-Path (Split-Path -Parent $PSScriptRoot) 'FNF-LCPS-All-in-One.html'
if (-not (Test-Path -LiteralPath $gamePath)) { throw "Place FNF-LCPS-All-in-One.html next to this repository folder." }
gh auth status
if ($LASTEXITCODE -ne 0) { throw 'Run gh auth login first.' }
$accountName = gh api user --jq .login
if ($LASTEXITCODE -ne 0) { throw 'Cannot read the signed-in GitHub account.' }
$repoName = "$accountName/fnf-lcps-offline"
gh repo view $repoName --json name 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
    gh repo create $repoName --private --description 'Personal offline FNF v0.8.6 Chromebook edition' --source . --remote origin --push
    if ($LASTEXITCODE -ne 0) { throw 'Repository creation failed.' }
} else {
    $repoVisibility = gh repo view $repoName --json visibility --jq .visibility
    if ($repoVisibility -ne 'PRIVATE') { throw 'The existing repository must be private before uploading game assets.' }
}
gh release view offline-v0.8.6 --repo $repoName 2>$null | Out-Null
if ($LASTEXITCODE -ne 0) {
    gh release create offline-v0.8.6 --repo $repoName --title 'FNF LCPS Offline v0.8.6' --notes-file RELEASE-NOTES.md
    if ($LASTEXITCODE -ne 0) { throw 'Release creation failed.' }
}
gh release upload offline-v0.8.6 $gamePath FNF-LCPS-All-in-One.sha256 --repo $repoName --clobber
if ($LASTEXITCODE -ne 0) { throw 'Game upload failed.' }
Write-Host "Download page: https://github.com/$repoName/releases/tag/offline-v0.8.6"
