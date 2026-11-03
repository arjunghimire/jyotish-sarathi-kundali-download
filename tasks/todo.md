# Move binaries from git to GitHub Releases (v8.0.44)

Context: push to main rejected, `latest/macos/jyotishsarathi.dmg` is 111 MB (> GitHub 100 MB limit).

- [ ] Rewrite the 2 unpushed commits: `git reset --soft origin/main`, untrack `latest/`
- [ ] `.gitignore`: `latest/`, `.DS_Store`
- [ ] Bump `VERSION` and `package.json` to 8.0.44
- [ ] `README.md`: links to `releases/latest/download/<file>`, new release steps
- [ ] `scripts/publish.sh`: `gh release create` instead of orphan squash + force push
- [ ] Branch `fix/move-binaries-to-releases`, commit, push, open PR
- [ ] Create release v8.0.44 with dmg/exe/msi, verify download URLs

## Review
