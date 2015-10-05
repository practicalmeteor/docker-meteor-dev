#!/bin/bash

if [ ! -e "/home/meteor/.bashrc" ]; then
    >&2 echo "Error: /home/meteor/.bashrc is missing. Exiting."
    exit 1
fi

grep 'export TERM=' "/home/meteor/.bashrc"

if [ $? -eq 0 ]; then
    echo "INFO: .bashrc already initialized. Exiting."
    exit 0
fi

echo "export TERM=xterm" >> /home/meteor/.bashrc

if [ -z "$METEOR_ENV" ]; then
    >&2 echo "WARNING: The METEOR_ENV environment variable is missing. It will not be added to .bashrc."
else
  echo "export METEOR_ENV=$METEOR_ENV" >> /home/meteor/.bashrc
fi

echo 'cd $HOME' >> /home/meteor/.bashrc
