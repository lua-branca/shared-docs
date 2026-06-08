#!/bin/bash
# One-Click Upload to GitHub (Stateless)
# URL: https://github.com/lua-branca/shared-docs.git

REMOTE_URL="https://github.com/lua-branca/shared-docs.git"
BRANCH="main"

echo "========================================"
echo "🚀 Uploading to GitHub: Shared Docs"
echo "========================================"

git init
git remote add origin "$REMOTE_URL"
git checkout -b main 2>/dev/null || git branch -m main
echo "📡 Fetching history..."
git fetch --depth=1 origin "$BRANCH"
git reset --soft "origin/$BRANCH"

echo "📦 Staging files..."
git add .
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
echo "Cw Committing changes..."
git commit -m "Update from Drive: $TIMESTAMP"

echo "Lr Pushing to GitHub..."
git push origin "$BRANCH"

echo "🧹 Cleaning up local .git folder..."
rm -rf .git

echo "========================================"
echo "✅ Done!"
echo "========================================"
