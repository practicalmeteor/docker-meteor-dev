#!/bin/bash -xe

apt-get -y install software-properties-common
add-apt-repository -y ppa:git-core/ppa

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | \
    tee /etc/apt/sources.list.d/mongodb-org-3.0.list


# updates specific source files
#apt-get update -o Dir::Etc::sourcelist="git-core-ppa-trusty.list"
#apt-get update -o Dir::Etc::sourcelist="mongodb-org-3.0.list"

apt-get update
apt-get -y install wget git tree ntp fontconfig zip jq default-jre \
    mongodb-org-shell mongodb-org-tools
