#!/usr/bin/env bash
set -euo pipefail

# Usage: .github/scripts/detect_version_bump.sh
# Outputs GITHUB_OUTPUT variables: version and source (cargo|package)

# Ensure we have main
git fetch origin main --depth=1 || true

# Get changed files between main and HEAD
CHANGED_FILES=$(git diff --name-only origin/main...HEAD || true)

VERSION=""
SOURCE=""

if echo "$CHANGED_FILES" | grep -q '^Cargo.toml$'; then
  # parse Cargo.toml
  VERSION=$(grep -E '^version\s*=\s*"' Cargo.toml | head -n1 | sed -E 's/version\s*=\s*"(.+)"/\1/') || true
  SOURCE="cargo"
fi

if [ -z "$VERSION" ] && echo "$CHANGED_FILES" | grep -q '^package.json$'; then
  # parse package.json using node
  VERSION=$(node -e "console.log(require('./package.json').version)" | tr -d '\n' ) || true
  SOURCE="package"
fi

# Emit outputs for GitHub Actions
if [ -n "$VERSION" ]; then
  echo "version=$VERSION" >> "$GITHUB_OUTPUT"
  echo "source=$SOURCE" >> "$GITHUB_OUTPUT"
  exit 0
else
  echo "version=" >> "$GITHUB_OUTPUT"
  echo "source=" >> "$GITHUB_OUTPUT"
  exit 0
fi
