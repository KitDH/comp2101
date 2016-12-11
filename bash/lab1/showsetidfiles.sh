#!/bin/bash
# This scripts shows a list of all the setuid and setid files in the /usr
# directory

echo "The SETUID files in /usr are:"
echo "-----------------------------"
find /usr -type f -perm -4000 -ls
echo
echo "The SETGID files in /usr are:"
echo "-----------------------------"
find /usr -type f -perm -2000 -ls

