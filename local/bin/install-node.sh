#!/bin/bash -xe


curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | /bin/bash \
    && /nvm/nvm.sh
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
