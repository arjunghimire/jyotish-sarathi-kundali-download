#!/usr/bin/env bash
#
# Publish the latest binaries as a GitHub Release.
#
# Binaries are NOT committed to git: GitHub rejects files over 100 MB, and
# release assets allow up to 2 GB with no bandwidth cap. Download links under
# https://github.com/<owner>/<repo>/releases/latest/download/<file> always
# resolve to the newest published release, so they stay stable across versions.
#
# Usage: drop jyotishsarathi.dmg / jyotishsarathi.msi / jyotishsarathi.exe into
# latest/macos / latest/windows, bump VERSION, commit, then `npm run release`.
#
set -euo pipefail

# Run from the repo root regardless of where the script is invoked.
cd "$(dirname "$0")/.."

VERSION="$(cat VERSION)"
TAG="v${VERSION}"

ASSETS=(
  latest/macos/jyotishsarathi.dmg
  latest/windows/jyotishsarathi.msi
  latest/windows/jyotishsarathi.exe
)

for f in "${ASSETS[@]}"; do
  if [[ ! -f "$f" ]]; then
    echo "error: missing asset $f" >&2
    exit 1
  fi
done

if gh release view "${TAG}" >/dev/null 2>&1; then
  echo "error: release ${TAG} already exists. Bump VERSION or delete it with: gh release delete ${TAG}" >&2
  exit 1
fi

echo "==> Publishing ${TAG}"

gh release create "${TAG}" "${ASSETS[@]}" \
  --title "${TAG}" \
  --notes "Jyotish Sarathi ${VERSION} (macOS arm64 dmg, Windows x86_64 msi/exe)" \
  --latest

echo "==> Done:"
for f in "${ASSETS[@]}"; do
  echo "    https://github.com/arjunghimire/jyotish-sarathi-kundali-download/releases/latest/download/$(basename "$f")"
done
