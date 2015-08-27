#!/bin/bash

if [ -z ${DEVELOPER+x} ];
then
    echo "Missing DEVELOPER env var"
    exit 1
else
    exec /sbin/setuser dev echo "source ~/repos/shopify-lavaina/bin/$DEVELOPER.bashrc.sh" >> ~/.bashrc
    exec /sbin/setuser dev echo "source ~/repos/shopify-lavaina/bin/lavaina.bashrc.sh" >> ~/.bashrc
fi
