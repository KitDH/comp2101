#!/bin/bash

#look up animals by their colours using an index

# Creates an array with some colours in it
colours=("red" "green" "blue" "yellow")

# Creates a hash of the animals which relates to the values in the ~Colours~ array 
declare -A animals
animals=(["red"]="cardinal" ["blue"]="lobster" ["green"]="frog" ["yellow"]="canary")

######
# Main
######

# Displays the colours and animals arrays
echo "The colours array has ${colours[0]}, ${colours[1]}, and ${colours[2]} in it."
echo "The @ symbol shows us all the colours in the array: ${colours[@]}."
echo "The animals are ${animals[red]}, ${animals[green]}, ${animals[blue]} and ${animals[yellow]}."
echo "The animals hash contains ${animals[@]}."
echo "Their colours are ${!animals[@]}."

# Gets a number from the user and look up the specific animal from the array
read -p "Give me a number from 0 to 3: " num
colour=${colours[$num]}
animal=${animals[$colour]}
echo "Index $num gives us a $colour $animal."