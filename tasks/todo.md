# Move binaries from git to GitHub Releases (v8.0.44)

Context: push to main rejected, `latest/macos/jyotishsarathi.dmg` is 111 MB (> GitHub 100 MB limit).

- [x] Rewrite the 2 unpushed commits: `git reset --soft origin/main`, untrack `latest/`
- [x] `.gitignore`: `latest/`, `.DS_Store`
- [x] Bump `VERSION` and `package.json` to 8.0.44
- [x] `README.md`: links to `releases/latest/download/<file>`, new release steps
- [x] `scripts/publish.sh`: `gh release create` instead of orphan squash + force push
- [x] Branch `fix/move-binaries-to-releases`, commit, push, open PR
- [x] Create release v8.0.44 with dmg/exe/msi, verify download URLs

## Review
- Branch `fix/move-binaries-to-releases`, PR #1 open against main.
- Release v8.0.44 published (not draft, resolves as releases/latest) with dmg 116.7 MB, msi 57.1 MB, exe 55.5 MB. Tag points at origin/main HEAD (d7c3a69).
- `releases/latest/download/<file>` URLs verified: HTTP 200 after redirect for dmg/msi/exe.
- Old `raw/main/latest/...` links keep serving the 6.0.0 binaries until PR merges, then 404.
