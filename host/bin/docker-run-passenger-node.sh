#!/bin/sh

docker run -d -v `pwd`:/repo --name passenger phusion/passenger-nodejs:0.9.17
