#! /usr/bin/env bash
# [go-task](https://taskfile.dev/)
# Run home and tooling updates via Task.
# go-task is installed as `task` on macOS.
if [[ -x "$(command -v task)" ]]; then
	UPDATES_TASKFILE="$HOME/.config/go-task/updates/Taskfile.yml"
	# Default to the `all` aggregation task when no arguments are given.
	updates() {
		task --taskfile "$UPDATES_TASKFILE" "${@:-all}"
	}
fi
