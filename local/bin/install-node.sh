#!/bin/bash -xe


/sbin/setuser dev curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | /bin/bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
