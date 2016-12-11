#!/bin/bash

# This script creates an array with eleven different foods. It creates two
# variables, each with random numbers in them from 1 to 6. It adds the two
# numbers together & uses the sum as an index to display a food from your array.


# first we create a food array 
foodlist=(cheese bread tomato pizza rice souvlaki "pan pizza" "deep-dish pizza" hamburger porkchop BRAINS mud "a secret menu item")

# then we roll the equivalent of two six-sided dice
die=$((RANDOM %12 + 2))


#look up the data first to make the output command more readable
foodlist=${foodlist[$die]}
#everything done?!!?
echo "The random number generator rolled a value of $die, which produces $foodlist!"