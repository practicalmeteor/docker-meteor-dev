#!/bin/bash -e

help="Usage:\n\$0 '<git user.name>' <git user.email>"

if [ -n "$1" ]
then
    echo "git user.name: $1"
    GIT_USER_NAME=$1
else
    echo -e $help
    exit 1
fi

if [ -n "$2" ]
then
    echo "git user.email: $2"
    GIT_USER_EMAIL=$2
else
    echo -e $help
    exit 1
fi

set -x

# Git configuration

git config --replace-all --global user.name "$GIT_USER_NAME"
git config --replace-all --global user.email $GIT_USER_EMAIL

# Disable GitHub SSH host key checking

mkdir -p ~/.ssh
echo -e 'Host github.com\n\tStrictHostKeyChecking no\n\tLogLevel ERROR\n' >> ~/.ssh/config

# Create your github ssh key
ssh-keygen -t rsa -C $GIT_USER_EMAIL -f ~/.ssh/id_rsa -N ''
echo -e "Copy your public ssh key and add it to your github account to enable password-less communication with github. Do it at:\nhttps://github.com/settings/ssh\n"
cat ~/.ssh/id_rsa.pub
