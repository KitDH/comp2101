#!/bin/bash

# A script that prompts the user for 2 numbers.
# This script performs each of the 5 arithmetic operations on the numbers the
# user inputs, then display the results in a more user-friendly way than
# previous scripts.

read -p "Please enter a number: " firstnumber
read -p "Please enter a second number: " secondnumber

sum=$(( firstnumber + secondnumber ))
echo "$firstnumber plus $secondnumber equals $sum."

echo "$firstnumber minus $secondnumber equals $(( firstnumber - secondnumber ))."
echo "$firstnumber times $secondnumber equals $(( firstnumber * secondnumber ))."
echo "$firstnumber divided by $secondnumber equals $(( firstnumber / secondnumber ))."
echo "$firstnumber divided by $secondnumber leaves a remainder of $(( firstnumber % secondnumber ))."