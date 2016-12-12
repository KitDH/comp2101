#!/bin/bash

# loop through the command line arguments. Note that $# represents the number
# of positional parameters

while [ $# -gt 0 ]; do
    
    # display each argument on its own line
	echo "$1"
	
	# Each time the script goes through the loop,, it shifts the arguments left.
	# the $2 argument moves into the $1 position and gets echoed. This goes on
	# until there aren't any more arguments ( $# greater than zero ).
	
	shift
done