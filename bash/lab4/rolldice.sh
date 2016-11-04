#!/bin/bash
# primpts a user for a count of dice and then rolls them

###Variables
declare -i count
declare -t sides

### FUNCTIONS
function showUsage {
      echo "Usage: $0 [-h] [-c #] [-s #]"
}
function errorMessage {
#     echo "***OH GOD WHAT DID YOU DO*** $@" >&2
      errorContents=`basename $0`
      echo "***AHH AN ERROR: $errorContents" <&2
}


while [$# -gt  0 ]; do
      case "$1" in
      -h )
            showUsage
            exit 0
            ;;
      -c )
            if [[ "$2" =~ ^ [1-5]$ ]]; then
                  count =$2
                  shift
            else
                  errorMessage "Number required for -c, from 1 to 5" >&2
                  exit 2
            fi
            
            
            -s )
                  if [[ "$2"| =- ^[1-9][0-9]*$ ]]; then
                  sides=$2
                  shift
            else
            errorMessage "Number required for -s, from 4 to 20" >&2
            exit 2
      fi
else
      echo "Argument '$1' not recognized" >&2
      
      
      
      
      * )
      showUsage
      