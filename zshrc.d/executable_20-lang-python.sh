#! /usr/bin/env bash
# Python dev utilities
# [Pyenv](https://github.com/pyenv/pyenv)
# Install
# brew install pyenv

# Additional utilities for helping build Python versions
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
# brew install openssl readline sqlite3 xz zlib tcl-tk
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d "$PYENV_ROOT" ]]; then
    export PYTHON_CONFIGURE_OPTS='--enable-optimizations --with-lto'
    export PYTHON_CFLAGS='-march=native -mtune=native -O3'
    # Default to brew installed libraries for building Python
    # export LDFLAGS="-L$(brew --prefix)/opt/zlib/lib -L$(brew --prefix)/opt/bzip2/lib -L$(brew --prefix)/opt/sqlite3/lib"
    # export CPPFLAGS="-I$(brew --prefix)/opt/zlib/include -I$(brew --prefix)/opt/bzip2/include -I$(brew --prefix)/opt/sqlite3/include"
    PATH="$PYENV_ROOT/bin:$PATH"
    if [[ -x "$(command -v pyenv)" ]]; then
        eval "$(pyenv init -)"
    fi
fi
