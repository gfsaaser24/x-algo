# push-to-github.ps1
# One-shot script to push the x-algo skill to a private GitHub repo.
# Assumes gh CLI is installed and authenticated on this machine.
# Run from inside the x-algo/ directory.

$ErrorActionPreference = "Stop"

Write-Host "Resetting any partial .git state..." -ForegroundColor Cyan
if (Test-Path .git) {
    Remove-Item -Recurse -Force .git
}

Write-Host "Initializing fresh git repo..." -ForegroundColor Cyan
git init -b main
git config user.email "gabe@detailinggrowth.com"
git config user.name "Gabe Fletcher"

Write-Host "Staging files..." -ForegroundColor Cyan
git add -A

Write-Host "Committing..." -ForegroundColor Cyan
git commit -m "Initial commit: x-algo skill v1.0

Audit X content and ideate algorithm-aligned posts. Grounded in the actual
scoring weights from xai-org/x-algorithm (Phoenix/Grok release)."

Write-Host "Creating private repo gfsaasser24/x-algo and pushing..." -ForegroundColor Cyan
gh repo create gfsaasser24/x-algo --private --source=. --remote=origin --push --description "Claude skill: audit X (Twitter) content and ideate algorithm-aligned posts. Grounded in xai-org/x-algorithm."

Write-Host ""
Write-Host "Done. Repo at: https://github.com/gfsaasser24/x-algo" -ForegroundColor Green
