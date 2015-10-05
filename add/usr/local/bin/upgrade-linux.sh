#!/bin/bash -xe

apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"
