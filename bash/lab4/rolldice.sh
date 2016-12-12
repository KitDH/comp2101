#!/bin/bash
# prompts a user for a count of dice and then rolls them

###Variables
declare -i count ; count=0
declare -i sides ; sides=0


### FUNCTIONS
function showUsage {
      echo "Usage: $0 [--help] [-c #] [-s #]"
}
function errorMessage {
#     echo "***OH GOD WHAT DID YOU DO*** $@" >&2
      errorContents=`basename $0`
      echo "***AHH AN ERROR: $errorContents" >&2
      
}

# This section deals with any command-line input the user gives
# Prompts for the user to give values for $count and $sides are implemented
# further below 
while [ $# -gt  0 ]; do
      case "$1" in
      --help )  # matches the help argument
            showUsage
            exit 0
      ;; 
      -c )  # matches the count argument
            if [[ "$2" =~ ^[1-5]$ ]]; then
                  count=$2
                  shift
            else
                  errorMessage "The -c argument needs a number from 1 to 5"
                  exit 2
            fi
      ;;
      -s )  # matches the sides argument
            if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
            if [ "$2" -ge 4 -a "$2" -le 20 ]; then
                  sides=$2
                  shift
            else
                  errorMessage "The -s argument needs a number from 4 to 20"
                  exit 2
            fi
            else
                  errorMessage "The -s argument needs a number from 4 to 20"
                  exit 2
            fi
      ;;
      * )   # The catch-all case that returns the error function
            showUsage
            errorMessage "I don't understand '$1'"
            exit 2
      ;;
      esac
      shift
done
# The previous section assumes it can populate count and sides from arguments
# given at run-time. If none were provided, we must prompt the user for them

## Get a roll count if there wasn't one on the command line
# get a valid roll count from the user
until [[ $count =~ ^[1-5]$ ]]; do
      read -p "How many dice would you like to roll (from 1 to 5)? " count
# ignore empty guesses
      [ -n "$count" ] || :
# specificied count must have the number 1-5 only
#  [[ $count =~ ^[1-5]$ ]] && break
done
# get a valid number of sides from the user
while [ "$sides" -lt 4 -o "$sides" -gt 20 ]; do
      read -p "How many sides should the dice have[4-20]? " sides
# ignore empty number
      [ -n "$sides" ] || :
# specified sides must have the number 4-20 only
      if [[ "$sides" =~ ^[1-9][0-9]*$ ]]; then
            if [ "$sides" -ge 4 -a "$sides" -le 20 ]; then
                  break
            fi
      fi
done

## Do the script's work
# do the dice roll as many times as the user asked for
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
      rolled=$(($RANDOM % $sides +1))
      rollnum=$(($rolls + 1))
# show the roll results
      echo "Roll # $rollnum gave a $rolled."
done