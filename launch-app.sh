#!/bin/sh
set -e

if [ -n "${WATER_AUTH_SECRET_PATH}" ]; then
  waterAuthClientSecret=$(cat ${WATER_AUTH_SECRET_PATH})
fi

java -Djava.security.egd=file:/dev/./urandom -DoauthClientSecret=$waterAuthClientSecret -DkeystorePassword=$keystorePassword -jar app.jar $@

exec env "$@"
