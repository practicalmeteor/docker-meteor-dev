#!/bin/bash

if [ -e "/home/meteor/.ssh/id_rsa.pub" ]; then
    echo "INFO: An ssh key has already been generated for user meteor. Exiting."
    exit 0
fi

if [ -z "$GIT_USER_NAME" ]; then
    >&2 echo "ERROR: The GIT_USER_NAME environment variable is missing. Exiting."
    exit 1
fi

if [ -z "$GIT_USER_EMAIL" ]; then
    >&2 echo "ERROR: The GIT_USER_EMAIL environment variable is missing. Exiting."
    exit 1
fi

exec /sbin/setuser meteor git config --replace-all --global user.name "$GIT_USER_NAME"
exec /sbin/setuser meteor git config --replace-all --global user.email "$GIT_USER_EMAIL"

# Disable GitHub SSH host key checking / warning

exec /sbin/setuser meteor mkdir -p /home/meteor/.ssh
exec /sbin/setuser meteor echo -e 'Host github.com\n\tStrictHostKeyChecking no\n\tLogLevel ERROR\n' >> /home/meteor/.ssh/config

# Generate an ssh key to connect to github
exec /sbin/setuser meteor ssh-keygen -t rsa -C $GIT_USER_EMAIL -f /home/meteor/.ssh/id_rsa -N ''
echo -e "Copy the following public ssh key and add it to your github account to enable password-less github ssh access. Do it at:\nhttps://github.com/settings/ssh\n"
exec /sbin/setuser meteor cat /home/meteor/.ssh/id_rsa.pub
