#!/bin/bash

#/sbin/setuser meteor curl -L -o /tmp/install-meteor.sh https://install.meteor.com/
#
#/sbin/setuser meteor sh /tmp/install-meteor.sh

set -e
curl https://install.meteor.com/ | /sbin/setuser meteor sh
set +e

if [ -e "/home/meteor/.meteor" ]; then
  echo "INFO: meteor successfully installed in /home/meteor/.meteor"
else
  >&2 echo "ERROR: meteor not found at /home/meteor/.meteor"
  exit 1
fi
