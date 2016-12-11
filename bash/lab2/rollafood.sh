#!/bin/bash

# This script creates an array with eleven different foods. It creates two
# variables, each with random numbers in them from 1 to 6. It adds the two
# numbers together & uses the sum as an index to display a food from your array.


# first we create a food array 
foodlist=(cheese bread tomato pizza rice souvlaki "pan pizza" "deep-dish pizza" hamburger porkchop mud)

# then we roll two six-sided dice
die1=$((RANDOM %6))
die2=$((RANDOM %6))

# the food index represents the sum of the rolled dice values (0-10)
foodindex=$((die1 + die2))

# we have to add 2 to the dicetotal value because the computer generates numbers
# with a range of 0-5 instead of the 1-6 range of real-world dic
dicetotal=$((die1 + die2 + 2))

#look up thr data first to make the output command more readable
foodlist=${foodlist[$foodindex]}
#everything done?!!?
echo "The random number generator rolled a value of $dicetotal, which produces $foodlist!"