#!/bin/bash

# This script takes care of updating git

# This method is better than using using $1 to blindly grab any arguments
# provuded by the user. A good script would checking if $1 has anything in it
# and with something like: read -p "Update Message? " message
git add -A
git commit -m "$1"
git push