#! /usr/bin/env bash
# [Java](https://www.java.com/)
# Install
# brew install openjdk
# brew install jenv

JAVACMD="$(brew --prefix openjdk)/bin/java"
if [[ -x "$(command -v "$JAVACMD")" ]]; then
    # $ brew install openjdk
    # $ jenv add $(brew --prefix)/opt/openjdk
    # $ $(brew --prefix openjdk)/bin/java --version | xargs --verbose bash -c 'jenv global $1'
    if [[ -x "$(command -v jenv)" ]]; then
        # export PATH="$HOME/.jenv/bin:$PATH"
        eval "$(jenv init -)"
        # jenv may need to be configured with a global JVM
        # For example:
        # $ brew install openjdk
        # $ jenv add $(brew --prefix)/opt/openjdk
        # $ $(brew --prefix openjdk)/bin/java --version | xargs bash -c 'jenv global $1'

        # after brew update for openjdk
        # $ find -L $HOME/.jenv/versions -type d -samefile $(brew --prefix openjdk) -print0 | xargs --null -n1 basename | xargs jenv remove
        # $ jenv global system
        # $ jenv add $(brew --prefix openjdk)
        # $ $(brew --prefix openjdk)/bin/java --version | xargs bash -c 'jenv global $1'
    fi
fi

# Specmatic
export SPECMATIC_HOME="$HOME/bin"
if [[ -f "$SPECMATIC_HOME/specmatic.jar" ]]; then
    alias specmatic='java -jar $SPECMATIC_HOME/specmatic.jar'
fi
