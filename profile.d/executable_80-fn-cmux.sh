#! /usr/bin/env bash
# [cmux](https://cmux.com/)
# Free and open source native macOS terminal built on Ghostty for working with AI coding agents
if [[ $- == *i* ]]; then
	if [[ -x "$(command -v cmux)" ]]; then
		cmux-here() {
			local dir="${1:-.}"
			dir="$(cd "$dir" && pwd)"
			cmux new-workspace \
				--name "$(basename "$dir")" \
				--cwd "$dir" \
				--layout '{"direction":"horizontal","split":0.5,"children":[{"pane":{"surfaces"
  :[{"type":"terminal"}]}},{"pane":{"surfaces":[{"type":"terminal"}]}}]}' \
				--focus true
		}
	fi
fi
