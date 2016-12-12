#!/bin/bash
# This does a thing! It displays how many regular files there are in a user-
# specified directory and how much disk space they use. It should also show the
# sizes and names of a given number of files (a default of 3) in that directory.

## Time to define some variables!!

# we create a variable for the number of files
# to show and set a default value of 3 
declare -i showFiles ; showFiles=3 
declare -i countFiles # a variable that holds the number of files found
directory=~/Pictures #the default directory where the script will look


### Functions
function expectedArguments {
      echo "Usage: $0 [--help] [-n #] [directory]"
}
function error-Message {
    echo "***AHH AN ERROR***: $@" >&2
}

###MAIN AREA~~~

## Process (??) our command line
# this lets the user specify the directory and the number of files to be shown
#
DirectoryAlreadyGiven=no
while [ $# -gt 0 ]; do
      case "$1" in
            --help )  # matches the help argument
                  expectedArguments
                  exit 0
            ;;
            -n )  # matches the argument for the number of files to show
                  if [[ "$2" =~ ^[1-9][0-9]* ]]; then
                        showFiles=$2
                        shift
                  else
                        expectedArguments
                        error-Message "The -n option requires a count"
                        exit 1
                  fi
            ;;
            * )   # assume anything not matching --help or -n is a directory
                  if [ $DirectoryAlreadyGiven = "no" ]; then
                        directory=$1
                        DirectoryAlreadyGiven=yes
                  else
                        expectedArguments
                        error-Message "Are you trying to point to a directory? Because I couldn't understand '$1'." 
                        exit 1
                  fi
            ;;
      esac
      shift
done

if [ ! -d "$directory" ]; then
      error-Message "Can't find this directory $directory"
      exit 1
fi


echo "The $directory directory contains `find $directory -type f | wc -l` files."
echo "The $directory directory uses `du -sh "$directory" | awk '{print $1}'` of disk space."; echo
echo "The $showFiles largest files in the "$directory" directory are:"
echo "---------------------------------------------------------------"
du -h "$directory"/* | sort -h | tail -$showFiles