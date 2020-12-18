#!/bin/bash

include_pattern=""
exlude_pattern=""

while getopts ":b:i:e:" opt; do
  case $opt in
    b) binary="$OPTARG"
    ;;
    i) include_pattern="$OPTARG"
    ;;
    e) exclude_pattern="$OPTARG"
    ;;
    *) echo "Usage:"
        echo "-b <binary path>"
        echo "-i <include pattern"
        echo "-e <exlucde pattern"
        exit 1
    ;;
  esac
done

pattern_args=""

if [ "$include_pattern" != "" ]
then
    pattern_args="| grep -e $include_pattern"
fi

if [ "$exclude_pattern" != "" ]
then
    pattern_args="${pattern_args} | grep -v ${exclude_pattern}"
fi

cmd_str=nm

"$cmd_str ${binary} ${pattern_args}"
