#! /usr/bin/env bash
# [pkgx](https://pkgx.sh/)
# Install
# brew install pkgxdev/made/pkgx
if [[ -x "$(command -v pkgx)" ]]; then
    # `source <(pkgx --shellcode)`
    eval "$(pkgx --shellcode)"
fi
