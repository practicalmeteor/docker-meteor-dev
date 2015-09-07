#!/bin/bash -e

help="Usage:\n\n$0 <your developer username>"

if [ -n "$1" ]
then
    echo "DEVELOPER=$1"
    DEVELOPER=$1
else
    echo -e $help
    exit 1
fi

set -x

# Setup .bashrc
echo "" >> ~/.bashrc
echo "# LaVaina additions" >> ~/.bashrc
echo "export DEVELOPER=$DEVELOPER" >> ~/.bashrc
echo "source $HOME/repos/shopify-lavaina/bin/$DEVELOPER.bashrc.sh" >> ~/.bashrc
echo "source $HOME/repos/shopify-lavaina/bin/lavaina.bashrc.sh" >> ~/.bashrc
source ~/.bashrc
