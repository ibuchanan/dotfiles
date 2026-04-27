#! /usr/bin/env bash
# [bun](https://bun.com/)
# curl -fsSL https://bun.sh/install | bash
if [[ -x "$(command -v bunx)" ]]; then
    alias auggie='bunx -bun auggie'
    alias firecrawl='bunx firecrawl-cli'
    alias vskill='bunx vskill'
fi
