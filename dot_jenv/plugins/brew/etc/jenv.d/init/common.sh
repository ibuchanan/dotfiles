#! /usr/bin/env bash
_java_version() {
    # jenv-add already does better version parsing for all JDKs
    # but this works for openjdk
    "$(brew --prefix openjdk)"/bin/java --version | head -1 | cut -f2 -d' '
}

_brew_versions() {
    find -L "$(jenv root)/versions" -type d -samefile "$(brew --prefix openjdk)" -exec basename {} +
}

_add_brew_versions() {
    jenv add "$(brew --prefix openjdk)"
    jenv global "$(_java_version)"
}

_remove_brew_versions() {
    _brew_versions | xargs jenv remove
    jenv global --unset
}

_jenv_brew_hook() {
    # shellcheck disable=SC2207
    AVAILABLE_VERSIONS=($(_brew_versions))
    if ! [[ ${AVAILABLE_VERSIONS[*]} ]]; then
        # on a fresh brew install
        # there won't be any available brew versions symlinked to the brew version
        echo "jenv: No brew versions found..."
        _add_brew_versions
    elif ! [[ " ${AVAILABLE_VERSIONS[*]} " == *" $(_java_version) "* ]]; then
        # after brew update for openjdk
        # the available jenv versions won't match current brew version
        echo "jenv: Brew version did not match jenv..."
        _remove_brew_versions
        _add_brew_versions
    fi
}
