#!/bin/bash

# Creates an array containing 11 different food names. Creates two variables w/
# random numbers in them from 1-6 each. Adds the two numbers together and uses
# the sum as an index to display a food from your array.


# create an array of food
foods=(apple banana pizza wings beer steak sandwich "pop tarts" chicken ribs dirt)

#roll two standard six-sided dice
die1=$((RANDOM %6))
die2=$((RANDOM %6))

# the food index is 0-10
foodindex=$((die1 + die2))

# dicetotal, requires an additional 2 because the remainders generated with a
# range of 0-5 while dice have a range of 1-6
dicetotal=$((die1 + die2 + 2))

#look up thr data first to make the output command more readable
food=${foods[$foodindex]}
#everything done?!!?
echo "The random number generator rolled $dicetotal which produces $food!"