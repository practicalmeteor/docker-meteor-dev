#!/bin/bash -e

if [ -n "$TRAVIS" ] && [ -n "$USE_METEOR_SUBMODULE" ]; then
  echo "Running meteor from a checkout in Travis CI, no need to install it."
else
  curl https://install.meteor.com/ | sh
  meteor --version
fi
