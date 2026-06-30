#! /usr/bin/env bash
# [bun](https://bun.com/)
# curl -fsSL https://bun.sh/install | bash
BUN_BIN="$HOME/.bun/bin"
if [[ -x "$(command -v bun)" && -d "$BUN_BIN" ]]; then
    alias cspell='bun run "$BUN_BIN/cspell"'
    alias ctx7='bun run "$BUN_BIN/ctx7"'
    alias firecrawl='bun run "$BUN_BIN/firecrawl"'
    alias license-checker-evergreen='bun run "$BUN_BIN/license-checker-evergreen"'
    alias markdownlint-cli2='bun run "$BUN_BIN/markdownlint-cli2"'
    alias npmPkgJsonLint='bun run "$BUN_BIN/npmPkgJsonLint"'
    alias pf='bun run "$BUN_BIN/pf"'
    alias promptfoo='bun run "$BUN_BIN/promptfoo"'
    alias sort-package-json='bun run "$BUN_BIN/sort-package-json"'
    alias vskill='bun run "$BUN_BIN/vskill"'
fi
