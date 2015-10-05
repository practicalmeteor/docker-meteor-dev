#!/bin/sh

if [ -n "$1" ]; then
  docker exec -t -i -u $1 passenger bash -l
else
  docker exec -t -i passenger bash -l
fi
