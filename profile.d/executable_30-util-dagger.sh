#! /usr/bin/env bash
# [Dagger](https://dagger.io/)
# Install
# brew tap "dagger/tap"
# brew install dagger

if [[ -x "$(command -v dagger)" && -x "$(command -v podman)" ]]; then
	export _EXPERIMENTAL_DAGGER_RUNNER_HOST='image+podman://registry.dagger.io/engine:v0.21.9'
fi
