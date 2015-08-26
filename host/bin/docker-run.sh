#!/bin/sh

sudo docker run -d --net=host -v ~/repos/:/home/dev/repos --name $1 -e GIT_USER_NAME=$2 -e GIT_USER_EMAIL=$3 -e DEVELOPER=$4 -i -t practicalmeteor/meteor-dev bash
