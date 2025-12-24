#!/usr/bin/env bash
set -euo pipefail

CHANGELOG_FILE="Documentation/CHANGELOG.md"

# Ensure we have tags and full history
git fetch --tags --prune --unshallow || true

# Determine range of commits since last tag (if any)
LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || true)
if [ -n "${LAST_TAG}" ]; then
  RANGE="${LAST_TAG}..HEAD"
else
  RANGE="HEAD"
fi

# Collect commits (skip merge commits)
COMMITS=$(git log ${RANGE} --no-merges --pretty=format:"- %s (%h)" || true)

if [ -z "${COMMITS}" ]; then
  echo "No new commits to add to changelog."
  exit 0
fi

DATE=$(date -u +%Y-%m-%d)

# Prepare a temporary changelog with inserted entries under 'Unreleased'
awk -v commits="${COMMITS}" -v date="${DATE}" '
BEGIN{printed=0}
{
  print $0
  if(!printed && $0 ~ /^## \[Unreleased\]/){
    print ""
    print "### Automated entries - " date
    n = split(commits, arr, "\n")
    for(i=1;i<=n;i++){
      if(arr[i]!="") print arr[i]
    }
    print ""
    printed=1
  }
}
' "${CHANGELOG_FILE}" > "${CHANGELOG_FILE}.tmp"

# If there's a difference, commit and push
if ! diff -q "${CHANGELOG_FILE}" "${CHANGELOG_FILE}.tmp" >/dev/null 2>&1; then
  mv "${CHANGELOG_FILE}.tmp" "${CHANGELOG_FILE}"
  git config user.name "github-actions[bot]"
  git config user.email "github-actions[bot]@users.noreply.github.com"
  git add "${CHANGELOG_FILE}"
  git commit -m "chore(changelog): update from commits"
  # Use token to push
  git push origin HEAD
  echo "Changelog updated and pushed."
else
  rm "${CHANGELOG_FILE}.tmp"
  echo "No changelog changes."
fi
