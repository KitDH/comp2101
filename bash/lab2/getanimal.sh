#!/bin/bash
# This script looks up animals by their colours with the awesome power of an
# index.

# first we create an array with some colours in it
colours=("red" "yellow" "green" "blue")

# then we create a hash of the animals relating to the values in our previously
# created colours array 
declare -A animals
animals=(["red"]="cardinal" ["yellow"]="canary" ["green"]="frog" ["blue"]="lobster")

######
# Main
######

# This section presents the user with the values in the colours & animals arrays
echo "The colours array has ${colours[0]}, ${colours[1]}, and ${colours[2]} in it."
echo "The @ symbol shows us all the colours in the array: ${colours[@]}."
echo "The animals are ${animals[red]}, ${animals[yellow]}, ${animals[green]}, and ${animals[blue]}."
echo "The animals hash contains: ${animals[@]}"
echo "Their colours are ${!animals[@]}."

# This portion gets a number from the user and looks up the specific animal
# from the array
read -p "Please enter a number from 0 to 3: " num
colour=${colours[$num]}
animal=${animals[$colour]}
echo "Index $num contains a $colour $animal."