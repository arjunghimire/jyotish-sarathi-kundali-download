#!/usr/bin/env bash
#
# Publish the latest binaries WITHOUT bloating git history.
#
# Drop the new jyotishsarathi.dmg / jyotishsarathi.exe into latest/macos /
# latest/windows (and bump VERSION), then run `npm run release`. This rewrites
# history into a single commit so old binary versions never accumulate, then
# force-pushes to origin/main.
#
set -euo pipefail

# Run from the repo root regardless of where the script is invoked.
cd "$(dirname "$0")/.."

VERSION="$(cat VERSION)"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
TMP="_publish_$$"

echo "==> Publishing v${VERSION} (branch: ${BRANCH})"

# Build a fresh single-commit history containing only the current files.
git checkout --orphan "${TMP}"
git add -A
git commit -q -m "Latest jyotishsarathi binaries (macOS + Windows) — v${VERSION}"

# Replace the working branch with the squashed commit.
git branch -f "${BRANCH}" "${TMP}"
git checkout -q "${BRANCH}"
git branch -D "${TMP}"

# Force-push the rewritten history.
git push --force-with-lease origin "${BRANCH}"

# Reclaim local space by dropping the now-unreachable old binary blobs.
git reflog expire --expire=now --all
git gc --prune=now --quiet

echo "==> Done. Repo size:"
du -sh .git
