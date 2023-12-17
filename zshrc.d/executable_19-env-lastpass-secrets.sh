# LastPass & secrets
# [LastPass](https://www.lastpass.com/)
# Install
# brew install lastpass-cli
if [[ -x "$(command -v lpass)" ]]; then
    LPASS_AGENT_TIMEOUT=$(( 12 * 60 * 60 ))
    ## Atlassian Developer Environment
    export LPASS_ENV="devpartisan"
    export ATLASSIAN_ACCOUNT_EMAIL=$(lpass show ".env\\${LPASS_ENV}/account" --username)
    export ATLASSIAN_ACCOUNT_API_KEY=$(lpass show ".env\\${LPASS_ENV}/account" --password)
    export ATLASSIAN_ACCOUNT_ID=$(lpass show ".env\\${LPASS_ENV}/account" --field="id")
    export ATLASSIAN_APP_3LO_CLIENT_ID=$(lpass show ".env\\${LPASS_ENV}/3lo" --username)
    export ATLASSIAN_APP_3LO_CLIENT_SECRET=$(lpass show ".env\\${LPASS_ENV}/3lo" --password)
    export ATLASSIAN_APP_3LO_REDIRECT_URI=$(lpass show ".env\\${LPASS_ENV}/3lo" --url)
    export ATLASSIAN_APP_2LO_CLIENT_ID=$(lpass show ".env\\${LPASS_ENV}/2lo" --username)
    export ATLASSIAN_APP_2LO_CLIENT_SECRET=$(lpass show ".env\\${LPASS_ENV}/2lo" --password)
    export ATLASSIAN_APP_NAME=$(shuf -n1  /usr/share/dict/words)-$(shuf -n1  /usr/share/dict/words)-$(shuf -n1  /usr/share/dict/words)
    export ATLASSIAN_APP_ID=$(uuidgen)
    export ATLASSIAN_APP_CONNECT_PORT=
    export ATLASSIAN_APP_CONNECT_BASE_URL=https://${ATLASSIAN_APP_NAME}.example.com/
    export ATLASSIAN_ORGANIZATION_ID=$(lpass show ".env\\${LPASS_ENV}/organization" --username)
    export ATLASSIAN_ORGANIZATION_BEARER=$(lpass show ".env\\${LPASS_ENV}/organization" --password)
    export ATLASSIAN_SITE_NAME=$(lpass show ".env\\${LPASS_ENV}/site" --field="name")
    export ATLASSIAN_SITE_BASE_URL=$(lpass show ".env\\${LPASS_ENV}/site" --url)
    export ATLASSIAN_SITE_CLOUD_ID=$(lpass show ".env\\${LPASS_ENV}/site" --field="id")
    export ATLASSIAN_SITE_BASIC_USER=$(lpass show ".env\\${LPASS_ENV}/site" --username)
    export ATLASSIAN_SITE_BASIC_PASS=$(lpass show ".env\\${LPASS_ENV}/site" --password)
fi
