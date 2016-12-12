#!/bin/bash
# prompts a user for a count of dice and then rolls them

###Variables
declare -i count ; count=0
declare -i sides ; sides=0


### FUNCTIONS
function expectedArguments {
      echo "Usage: $0 [--help] [-c #] [-s #]"
}
function error-Message {
    echo "***AHH AN ERROR***: $@" >&2
}

# This section deals with any command-line input the user gives
# Prompts for the user to give values for $count and $sides are implemented
# further below 
while [ $# -gt  0 ]; do
      case "$1" in
      --help )  # matches the help argument
            expectedArguments
            exit 0
      ;; 
      -c )  # matches the count argument
            if [[ "$2" =~ ^[1-5]$ ]]; then
                  count=$2
                  shift
            else
                  error-Message "The -c argument needs a number from 1 to 5"
                  exit 2
            fi
      ;;
      -s )  # matches the sides argument
            if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
            if [ "$2" -ge 4 -a "$2" -le 20 ]; then
                  sides=$2
                  shift
            else
                  error-Message "The -s argument needs a number from 4 to 20"
                  exit 2
            fi
            else
                  error-Message "The -s argument needs a number from 4 to 20"
                  exit 2
            fi
      ;;
      * )   # The catch-all case that returns the error function
            expectedArguments
            error-Message "I don't understand '$1'"
            exit 2
      ;;
      esac
      shift
done
# The previous section assumes it can populate count and sides from arguments
# given at run-time. If none were provided, we must prompt the user for them

# Get a roll count if there wasn't one on the command line
# and make sure that it's a valid roll count

until [[ $count =~ ^[1-5]$ ]]; do
      read -p "How many dice would you like to roll (from 1 to 5)? " count
      [ -n "$count" ] || continue # ignore empty guesses
done

      # get a valid number (a natural number!) of sides from the user
while [ "$sides" -lt 4 -o "$sides" -gt 20 ]; do
      read -p "How many sides should the dice have (from 4 to 20)? " sides
      [ -n "$sides" ] || continue # ignore an empty number

      # the number of sides given must fall within the range of 4-20
      if [[ "$sides" =~ ^[1-9][0-9]*$ ]]; then
            if [ "$sides" -ge 4 -a "$sides" -le 20 ]; then
                  break
            fi
      fi
done

# Finally, the part where the script actually rolls some dice!
# This loop covers the user's ability to choose many counts

for (( rolls=0 ; rolls < count ; rolls++ )); do
      # the dice roll
      rolled=$(($RANDOM % $sides +1))
      rollnum=$(($rolls + 1))
      
      # What's the result?
      echo "Roll # $rollnum gave a $rolled."
done