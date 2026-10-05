#! /usr/bin/env bash
# [Dagger](https://dagger.io/)
# Install
# brew tap "dagger/tap"
# brew install dagger

if [[ -x "$(command -v dagger)" && -x "$(command -v podman)" ]]; then
    version=$(brew list --versions dagger)
    if [[ -n "$version" ]]; then
        export _EXPERIMENTAL_DAGGER_RUNNER_HOST="image+podman://registry.dagger.io/engine:v${version#* }"
    fi
fi
