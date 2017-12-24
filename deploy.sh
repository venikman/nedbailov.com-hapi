#!/usr/bin/env bash

set -eu;

URL="$(node_modules/.bin/now deploy --token=$ZEIT_TOKEN)";
node_modules/.bin/await-url "$URL" --tries=200;
node_modules/.bin/now alias set "$URL" nedbailov.com --team=venikman --token=$ZEIT_TOKEN;
# Attempt to remove old deployment, see https://github.com/zeit/now-cli/issues/691
node_modules/.bin/now remove noirdoor --yes --safe --team=venikman --token=$ZEIT_TOKEN || true;