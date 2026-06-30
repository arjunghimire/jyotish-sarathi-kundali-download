# Jyotish Sarathi — Downloads

Download the latest build of **Jyotish Sarathi** for your platform.

The download links below are **stable** — they always point to the latest release, so you can share them anywhere without worrying about version updates.

## Latest Release

Current version: see [`VERSION`](./VERSION)

| Platform | Architecture | Download |
| --- | --- | --- |
| macOS | Apple Silicon (arm64) | [jyotishsarathi.dmg](https://github.com/arjunghimire/jyotish-sarathi-kundali-download/raw/main/latest/macos/jyotishsarathi.dmg) |
| Windows | x86_64 | _coming soon_ |

## Releasing a New Version

To publish a new version (e.g. `7.0.0`) without breaking existing download links:

1. **Replace the file in `latest/`** with the new build, keeping the same filename:
   - macOS → `latest/macos/jyotishsarathi.dmg`
   - Windows → `latest/windows/jyotishsarathi.exe`
2. **Bump `VERSION`** to the new version number.
3. **Commit and push.** The download URLs above will now serve the new build automatically.

## Repository Layout

```
latest/                       ← stable download paths (URLs never change)
├── macos/
│   └── jyotishsarathi.dmg
└── windows/
    └── jyotishsarathi.exe    (planned)

VERSION                       ← current version number
```
