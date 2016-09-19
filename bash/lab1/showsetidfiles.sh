#!/bin/bash
# show a list of all the setuid and setid files in /usr 

echo "SETUID files in /usr"
echo "--------------------"
find /usr -type f -perm -4000 -ls
echo
echo "SETGID files in /usr"
echo "--------------------"
find /usr -type f -perm -2000 -ls

