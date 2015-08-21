#!/bin/sh

sudo docker run -d -t -i  --net=host -v ~/repos/:/repos -e GIT_USER_NAME=$1 -e GIT_USER_EMAIL=$2 -e DEVELOPER=$3  practicalmeteor/meteor-dev
