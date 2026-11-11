#! /usr/bin/env bash
# [Dagger](https://dagger.io/)
# Install
# brew tap "dagger/tap"
# brew install dagger

if [[ -x "$(command -v dagger)" && -x "$(command -v podman)" ]]; then
    version=$(brew list --versions dagger)
    if [[ -n "$version" ]]; then
        export DAGGER_ENGINE="image+podman://registry.dagger.io/engine:v${version#* }"
        export DAGGER_NO_NAG=1
    fi
fi
