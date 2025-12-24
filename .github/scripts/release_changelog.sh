#!/usr/bin/env bash
set -euo pipefail

# Usage: .github/scripts/release_changelog.sh <version>
# Moves entries under '## [Unreleased]' into a new section for the version and commits.

VERSION=${1:?Usage: release_changelog.sh <version>}
CHANGELOG=Documentation/CHANGELOG.md
DATE=$(date -u +%Y-%m-%d)

if [ ! -f "$CHANGELOG" ]; then
  echo "No changelog found at $CHANGELOG"
  exit 1
fi

# Extract Unreleased entries
awk -v ver="$VERSION" -v date="$DATE" '
  BEGIN{in_un=0; printed_ver=0}
  {
    if($0 ~ /^## \[Unreleased\]/){
      in_un=1; next
    }
    if(in_un && $0 ~ /^## \[/){
      # reached next section
      in_un=0
    }
    if(in_un){
      unlines = unlines $0 "\n"
    }
  }
  END{
    if(length(unlines)==0){
      print "" > "/dev/stderr"
      exit 2
    }
    # Now rewrite file: insert a version section after Unreleased header
  }
' "$CHANGELOG" >/dev/null 2>&1 || true

# Use sed to insert the version header after '## [Unreleased]'
# First, create a temp file with the new section
TMP=$(mktemp)
awk -v ver="$VERSION" -v date="$DATE" '
  BEGIN{in_un=0}
  {
    print $0
    if(!in_un && $0 ~ /^## \[Unreleased\]/){
      printf("\n## [%s] - %s\n", ver, date)
      in_un=1
      # Collect lines that were under Unreleased
      next
    }
  }
' "$CHANGELOG" > "$TMP".part

# Now extract the Unreleased block content and append under the new version header
UNBLOCK=$(awk 'BEGIN{p=0} /^## \[Unreleased\]/{p=1; next} /^## \[/{if(p==1) exit} {if(p==1) print}' "$CHANGELOG" | sed '/^$/d' ) || true

if [ -z "$UNBLOCK" ]; then
  echo "No Unreleased entries to promote." >&2
  exit 2
fi

# Build final content: replace '## [Unreleased]' section with same header followed by the new version and entries, then keep rest intact.
awk -v ver="$VERSION" -v date="$DATE" -v block="$UNBLOCK" '
  BEGIN{in_un=0}
  {
    if($0 ~ /^## \[Unreleased\]/){
      print $0
      print ""
      print "## [" ver "] - " date
      n = split(block, arr, "\n")
      for(i=1;i<=n;i++) print arr[i]
      print ""
      in_un=1
      next
    }
    print $0
  }
' "$CHANGELOG" > "$TMP"

mv "$TMP" "$CHANGELOG"

# Commit the changelog update
git config user.name "github-actions[bot]"
git config user.email "github-actions[bot]@users.noreply.github.com"

git add "$CHANGELOG"
if git diff --staged --quiet; then
  echo "No changelog changes to commit."
else
  git commit -m "chore(changelog): release $VERSION"
  # Push using token-authenticated URL when available (supports forks/permissions)
  if [ -n "${GITHUB_TOKEN:-}" ]; then
    git push "https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" HEAD
  else
    git push origin HEAD
  fi
fi

# Print release notes to stdout (Unreleased content)
echo "$UNBLOCK"
