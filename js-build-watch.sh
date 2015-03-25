# JS Build (https://github.com/fbeuster/js-build)
# Copyright (c) 2015 | Felix Beuster | BSD-2-Clause License
# All rights reserved.

#!/bin/bash

# color shortcuts
red='\x1b[1;31m'
white='\x1b[1;37m'

# check if file is given
if [ $# -lt 1 ]; then
  printf "${red}Error:${white} Missing input file.\n"
  exit
fi

# get the directory we want to track
DIR=`dirname $1`

# do the tracking
while true; do
  inotifywait -re close_write $DIR && ./js-build.sh $1
done