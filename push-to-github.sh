#!/usr/bin/env bash
# push-to-github.sh
# One-shot script to push the x-algo skill to a private GitHub repo.
# Assumes gh CLI is installed and authenticated.
# Run from inside the x-algo/ directory.

set -e

echo "Resetting any partial .git state..."
rm -rf .git

echo "Initializing fresh git repo..."
git init -b main
git config user.email "gabe@detailinggrowth.com"
git config user.name "Gabe Fletcher"

echo "Staging files..."
git add -A

echo "Committing..."
git commit -m "Initial commit: x-algo skill v1.0

Audit X content and ideate algorithm-aligned posts. Grounded in the actual
scoring weights from xai-org/x-algorithm (Phoenix/Grok release)."

echo "Creating private repo gfsaasser24/x-algo and pushing..."
gh repo create gfsaasser24/x-algo --private --source=. --remote=origin --push --description "Claude skill: audit X (Twitter) content and ideate algorithm-aligned posts. Grounded in xai-org/x-algorithm."

echo ""
echo "Done. Repo at: https://github.com/gfsaasser24/x-algo"
