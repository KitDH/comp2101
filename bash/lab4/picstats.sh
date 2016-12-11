#!/bin/bash
# This does a thing! It displays how many regular files there are in a user-
# specified directory and how much disk space they use. It should also show the
# sizes and names of a given number of files (a default of 3) in that directory.

## Time to define some variables!!
declare -i NumberOfFilesToShow #count is the number of files to show
NumberOfFilesToShow=3 #the default number of files shown is 3
directory=-~/Pictures #by default, the directory where the script looks for
declare -i filecount # a variable that holds the number of files found
d
###MAIN AREA~~~

## Process (??) our command line
# this lets the user specify the directory and filecount
#
DirectoryAlreadyGiven=no
while [$# -gt 0]; do
      case "$1" in
            -h )
                  echo "Usage: $0 [-h] [-c #] [directory]"
                  exit 0
                  ;;
            -c )
                  if [[ "$2" =~ ^[1-9][0-9]* ]]; then
                        NumberOfFilesToShow=$2
                        shift
                  else
                        echo "Usage: $0 [-h] [-c #] [directory]" >&2
                        echo "-c option requires a count" >&2
                        exit 1
                  fi
                  ;;
            * )
                  if [ $DirectoryAlreadyGiven = "no" ]; then
                        directory=$1
                        DirectoryAlreadyGiven=yes
                  else
                        echo "Usage: $0 [-h] [-c #] [directory]" >&2
                        echo "Massive understanding failure with $1" >&2
                        exit 1
                  fi
                  ;;
      esac
      shift
done

if [ ! -d "$directory"]; then
      echo "Can't find this directory $directory" >&2
else

fi

filecount=`find "$directory" -type f -wc -l
echo -n "In the "$directory" directory, there are $filecount files."

totalspaceused=`du -sh "$directory" | awk '{print $1}'`
echo -n "The Pictures directory uses "
du -sh "$directory" | awk '{print $1}'
echo ""

echo "The largest $NumberOfFilesToShow files in the "$directory" directory are:"
echo "--------------------------------------------------------"
du -h "$directory"/* | sort -h | tail -$NumberOfFilesToShow

