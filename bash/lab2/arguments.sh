#!/bin/bash
# This script demonstrates how to access the command line arguments. The
# expected behaviour only presents itself if the script is run from the command
# line (running it from the Cloud9 UI will not provide it with any arguments!)

echo "The command you entered was: $0."
echo "The number of arguments you entered was $#."

echo "The 1st argument was $1"
echo "The 2nd argument was $2"
echo "The 3rd argument was $3"

