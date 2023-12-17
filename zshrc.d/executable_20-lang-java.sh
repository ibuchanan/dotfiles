# [Java](https://www.java.com/)
# Install
# brew install jenv
# brew install openjdk
if [[ -x "$(command -v jenv)" ]]; then
    # export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
    # jenv may need to be configured with a global JVM
    # For example:
    # $ brew install openjdk@20
    # $ jenv global 20.0
fi

# Specmatic
export SPECMATIC_HOME="$HOME/bin"
if [[ -f "$SPECMATIC_HOME/specmatic.jar" ]]; then
    alias specmatic="java -jar $SPECMATIC_HOME/specmatic.jar"
fi
