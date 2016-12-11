#!/bin/bash
#
# Tis script contains an array of door prizes and prompts the user to pick one
# blindly. It then displays the prize the user has won

# first we create a prize array
prizelist=("new car" "shopping spree" "trip to hawaii" "weekend in vegas" "extra help after class" "big high five")
prizecount=${#prizelist[@]}

# then we randomly select a prize for door 1
prizenum=$(($RANDOM % $prizecount))
# then we populate the mysteryprizes array
declare -a mysteryprize
mysteryprize[0]=${prizelist[$prizenum]}

# we randomly select a prize for door 2
prizenum=$(($RANDOM %$prizecount))
# we add the prize for the second door into the mysteryprize array
mysteryprize[1]=${prizelist[$prizenum]}
# this section checks to make sure that the doors have different prizes, then
# repicks door2's prize if it does match
while [ "${mysteryprize[1]}" == "${mysteryprize[0]}" ]; do
	prizenum=$(($RANDOM %$prizecount))
	mysteryprize[1]=${prizelist[$prizenum]}
done

# we randomly select a prize for door 3
prizenum=$(($RANDOM %$prizecount))
mysteryprize[2]=${prizelist[$prizenum]}
# this section does the same check and repick as outlined for door2, but for
#door3
while [ "${mysteryprize[2]}" == "${mysteryprize[0]}" -o "${mysteryprize[2]}" == "${mysteryprize[1]}" ]; do
	prizenum=$(($RANDOM % $prizecount))
	mysteryprize[2]=${prizelist[$prizenum]}
done

cat <<EOF
There are three doors you can choose from.
Each door has a prize behind it~
1 - Door 1
2 - Door 2
3 - Door 3
EOF
until [[ "$pick" =~ ^[1-3]$ ]]; do
	read -p "Pick a mystery prize[1-3]: " pick
done

case $pick in
	1)
		echo "You won the ${mysteryprize[0]}!"
		echo "You didn't get a ${mysteryprize[1]} or a ${mysteryprize[2]}."
		;;
	2)
		echo "You won the ${mysteryprize[1]}!"
		echo "You didn't get a ${mysteryprize[0]} or a ${mysteryprize[2]}."
		;;
	3)
		echo "You won the ${mysteryprize[2]}!"
		echo "You didn't get a ${mysteryprize[1]} or a ${mysteryprize[0]}."
		;;
	*)
		echo "Your pick of $pick is weird."
		;;
esac