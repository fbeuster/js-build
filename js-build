# JS Build (https://github.com/fbeuster/js-build)
# Copyright (c) 2015 | Felix Beuster | BSD-2-Clause License
# All rights reserved.

#!/bin/bash

# color shortcuts
red='\x1b[1;31m'
white='\x1b[1;37m'

# file name is given?
if [ $# -eq 0 ]; then
  printf "${red}Error:${white} Missing input file.\n"
  exit
fi

# saving current path and main file
MAIN_NAME=`basename $1 .js`
CUR_PATH=`sed "s/$MAIN_NAME.js//g" <<< $1`
MAIN_FILE="$1"

# file exists
if [ ! -e $MAIN_FILE ]; then
  printf "${red}Error:${white} $MAIN_NAME.js not found.\n"
  exit
fi

# make a clean compile file
COMP_FILE="$CUR_PATH/${MAIN_NAME}_compiled.js"

touch $COMP_FILE
> $COMP_FILE

# iterating MAIN_FILE line-wise
while read -r line || [[ -n "$line" ]]
do
  # do we need to include a file?
  if [[ $line != "//@ "* ]]; then
    echo $line >> $COMP_FILE
  else
    # strip the line to file name
    INCLUDE_NAME=`sed "s/\/\/@ //g" <<< $line`
    INCLUDE_FILE="$CUR_PATH/$INCLUDE_NAME.js"

    # inckude file exists
    if [ ! -e $INCLUDE_FILE ]; then
      printf "${red}Error:${white} $INCLUDE_NAME.js not found.\n"
      exit
    fi

    # append the include file
    echo "// $INCLUDE_NAME" >> $COMP_FILE
    cat $INCLUDE_FILE >> $COMP_FILE
    printf "\n\n" >> $COMP_FILE
  fi
done < $MAIN_FILE