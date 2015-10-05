#!/bin/bash -e

adduser meteor --gecos "" --disabled-password
echo "meteor:password" | chpasswd
addgroup meteor sudo
echo 'meteor ALL = NOPASSWD : ALL' >> /etc/sudoers
