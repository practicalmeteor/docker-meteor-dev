#!/bin/sh

docker run -d -p 3000:3000 -p 3100:3100 -v $1:/home/meteor/repos --name dev -e METEOR_ENV=$2 practicalmeteor/meteor-dev:1.2.0.2
