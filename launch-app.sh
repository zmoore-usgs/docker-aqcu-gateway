#!/bin/sh
set -e

if [ -n "${OAUTH_CLIENT_SECRET_PATH}" ]; then
  oauthClientSecret=$(cat ${OAUTH_CLIENT_SECRET_PATH})
fi

java -Djava.security.egd=file:/dev/./urandom -DoauthClientSecret=$oauthClientSecret -DkeystorePassword=$keystorePassword -jar app.jar $@

exec env "$@"
