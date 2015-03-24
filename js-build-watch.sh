#!/bin/bash

# check if file is given
if [ $# -lt 1 ]; then
  echo "Missing arguments, exiting."
  echo "Use: ./js-build-watch FILE"
  exit
fi

# get the directory we want to track
DIR=`dirname $1`

# do the tracking
while true; do
  inotifywait -re close_write $DIR && ./js-build.sh $1
done