#!/bin/sh
set -e

java -Djava.security.egd=file:/dev/./urandom -DkeystorePassword=$keystorePassword -jar app.jar $@

exec env "$@"
