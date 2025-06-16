#! /usr/bin/env bash
# LastPass & secrets
# [LastPass](https://www.lastpass.com/)
# Install
# brew install lastpass-cli
if [[ -x "$(command -v lpass)" ]]; then
    LPASS_AGENT_TIMEOUT=$(( 12 * 60 * 60 ))
    export LPASS_AGENT_TIMEOUT
    export LPASS_ENV="devpartisan"
    ## GitHub
    export GITHUB_TOKEN=$(lpass show ".env\\${LPASS_ENV}/github" --password)

    ## Google Gemini
    export GOOGLE_API_KEY=$(lpass show ".env\\${LPASS_ENV}/gemini" --password)

    ## Atlassian Developer Environment
    ATLASSIAN_ACCOUNT_EMAIL=$(lpass show ".env\\${LPASS_ENV}/account" --username)
    export ATLASSIAN_ACCOUNT_EMAIL

    ATLASSIAN_ACCOUNT_API_KEY=$(lpass show ".env\\${LPASS_ENV}/account" --password)
    export ATLASSIAN_ACCOUNT_API_KEY

    ATLASSIAN_ACCOUNT_ID=$(lpass show ".env\\${LPASS_ENV}/account" --field="id")
    export ATLASSIAN_ACCOUNT_ID

    ATLASSIAN_APP_3LO_CLIENT_ID=$(lpass show ".env\\${LPASS_ENV}/3lo" --username)
    export ATLASSIAN_APP_3LO_CLIENT_ID

    ATLASSIAN_APP_3LO_CLIENT_SECRET=$(lpass show ".env\\${LPASS_ENV}/3lo" --password)
    export ATLASSIAN_APP_3LO_CLIENT_SECRET

    ATLASSIAN_APP_3LO_REDIRECT_URI=$(lpass show ".env\\${LPASS_ENV}/3lo" --url)
    export ATLASSIAN_APP_3LO_REDIRECT_URI

    ATLASSIAN_APP_2LO_CLIENT_ID=$(lpass show ".env\\${LPASS_ENV}/2lo" --username)
    export ATLASSIAN_APP_2LO_CLIENT_ID

    ATLASSIAN_APP_2LO_CLIENT_SECRET=$(lpass show ".env\\${LPASS_ENV}/2lo" --password)
    export ATLASSIAN_APP_2LO_CLIENT_SECRET

    ATLASSIAN_APP_NAME=$(shuf -n1  /usr/share/dict/words)-$(shuf -n1  /usr/share/dict/words)-$(shuf -n1  /usr/share/dict/words)
    export ATLASSIAN_APP_NAME

    ATLASSIAN_APP_ID=$(uuidgen)
    export ATLASSIAN_APP_ID

    ATLASSIAN_APP_CONNECT_PORT=
    export ATLASSIAN_APP_CONNECT_PORT

    ATLASSIAN_APP_CONNECT_BASE_URL=https://${ATLASSIAN_APP_NAME}.example.com/
    export ATLASSIAN_APP_CONNECT_BASE_URL

    ATLASSIAN_ORGANIZATION_ID=$(lpass show ".env\\${LPASS_ENV}/organization" --username)
    export ATLASSIAN_ORGANIZATION_ID

    ATLASSIAN_ORGANIZATION_BEARER=$(lpass show ".env\\${LPASS_ENV}/organization" --password)
    export ATLASSIAN_ORGANIZATION_BEARER

    ATLASSIAN_SITE_NAME=$(lpass show ".env\\${LPASS_ENV}/site" --field="name")
    export ATLASSIAN_SITE_NAME

    ATLASSIAN_SITE_BASE_URL=$(lpass show ".env\\${LPASS_ENV}/site" --url)
    export ATLASSIAN_SITE_BASE_URL

    ATLASSIAN_SITE_CLOUD_ID=$(lpass show ".env\\${LPASS_ENV}/site" --field="id")
    export ATLASSIAN_SITE_CLOUD_ID

    ATLASSIAN_SITE_BASIC_USER=$(lpass show ".env\\${LPASS_ENV}/site" --username)
    export ATLASSIAN_SITE_BASIC_USER

    ATLASSIAN_SITE_BASIC_PASS=$(lpass show ".env\\${LPASS_ENV}/site" --password)
    export ATLASSIAN_SITE_BASIC_PASS

    ## Forge specific
    FORGE_EMAIL=$ATLASSIAN_ACCOUNT_EMAIL
    export FORGE_EMAIL

    FORGE_API_TOKEN=$ATLASSIAN_ACCOUNT_API_KEY
    export FORGE_API_TOKEN

    NGROK_AUTHTOKEN=$(lpass show ".env\\${LPASS_ENV}/ngrok" --password)
    export NGROK_AUTHTOKEN

fi
