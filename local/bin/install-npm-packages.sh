#!/bin/bash -xe

set +x

if [ -z "$NPM_CMD" ]
then
  NPM_CMD="npm"
fi

set -x

$NPM_CMD install -g semver@5.0.1 deep-extend-cli@0.4.0 grunt-cli@0.1.13 \
    coffee-script@1.9.3 iced-coffee-script@108.0.7
