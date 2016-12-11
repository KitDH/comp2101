#!/bin/bash

#look up animals by their colours using an index

########
# Variables
########
# create an array with some colours in it
declare -a colours
colours=("red" 
    "green"
    "blue"
    "yellow"
    "orange"
    "black and white")

# create a hash of animals which relates to the colours array values
declare -A animals
animals=(["red"]="cardinal"
    ["blue"]="lobster"
    ["green"]="frog"
    ["yellow"]="canary"
    ["orange"]="trumpapottamus"
    ["black and white"]="zebra")

########
# Main
########
# use a for wordlist loop to display all the colours of animals

for colour in "${colours[@]}"; do
    animal=${animals[$colour]}
    echo "We have a $colour $animal"
done