# Jyotish Sarathi — Downloads

Download the latest build of **Jyotish Sarathi** for your platform.

The download links below are **stable** — they always point to the latest
published release, so you can share them anywhere without worrying about
version updates.

## Latest Release

Current version: see [`VERSION`](./VERSION)

| Platform | Architecture | Download |
| --- | --- | --- |
| macOS | Apple Silicon (arm64) | [jyotishsarathi.dmg](https://github.com/arjunghimire/jyotish-sarathi-kundali-download/releases/latest/download/jyotishsarathi.dmg) |
| Windows | x86_64 (installer) | [jyotishsarathi.msi](https://github.com/arjunghimire/jyotish-sarathi-kundali-download/releases/latest/download/jyotishsarathi.msi) |
| Windows | x86_64 (setup exe) | [jyotishsarathi.exe](https://github.com/arjunghimire/jyotish-sarathi-kundali-download/releases/latest/download/jyotishsarathi.exe) |

All versions: [Releases](https://github.com/arjunghimire/jyotish-sarathi-kundali-download/releases)

Binaries are published as GitHub Release assets, not committed to git.
GitHub rejects files over 100 MB in git, and release assets allow up to 2 GB
with no bandwidth cap.

## Releasing a New Version

Requires the [GitHub CLI](https://cli.github.com/) (`gh auth login` once).

1. **Drop the new builds into `latest/`** (git-ignored), keeping these filenames:
   - macOS → `latest/macos/jyotishsarathi.dmg`
   - Windows → `latest/windows/jyotishsarathi.msi` and `latest/windows/jyotishsarathi.exe`
2. **Bump `VERSION`** (and `package.json`) to the new version number.
3. **Commit and push** the version bump.
4. **Run `npm run release`.** This creates a GitHub Release tagged `v<VERSION>`,
   uploads the binaries, and marks it as the latest release. The download URLs
   above now serve the new build.

## Repository Layout

```
latest/                       ← local staging dir for builds (git-ignored)
├── macos/
│   └── jyotishsarathi.dmg
└── windows/
    ├── jyotishsarathi.msi
    └── jyotishsarathi.exe

VERSION                       ← current version number
scripts/publish.sh            ← creates the GitHub Release (npm run release)
```
