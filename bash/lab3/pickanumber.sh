#!/bin/bash


# A scripts that generates a random number from 1 to 10 & prompts the user to
# guess it. It'll keep asking the user to guess until their number matches
# the one it generated.

###########
# Variables
###########
# This generates the number that the user will have to gue
secretNumber=$(($RANDOM %10 + 1))

# since our loop is controlled by their guess, start with an incorrect guess
guess=10

# Main
######

# we aren't done until the user guesses our number, so keep asking until they get it right
while [ $guess -ne $secretNumber ]; do
    # get a number from them
    read -p "Pick a number from 1 to 10: " guess
    if [ -z $guess ]; then
        echo "Fine. You don't want to play"
        exit
    fi
    if [[ "$guess" =~ ^[1-9]$ || "$guess" = "10" ]]; then
    # valid guess
        if [ $guess -eq $secretNumber ]; then
        #they got it
            echo "You got it"
            exit
        else
            echo "Nope"
            if [ $guess -lt $secretNumber ]; then
                echo "Too low, try again"
            else
                echo "Too high, try again"
            fi
        fi
    else
        echo "Bad entry, I'm not playing with you"
        exit
    fi
done



    
    # give them feedback about their guess if it was wrong
    if [ $guess -lt $secretNumber ]; then
        echo "Too small, try again"
    elif [ $guess -gt $secretNumber ]; then
        echo "Too big, try again"
    fi
done

# loop ended, so they got it right, let them know
echo "You got it!"