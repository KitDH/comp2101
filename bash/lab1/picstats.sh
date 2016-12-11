#!/bin/bash
# This does a thing! It displays how many regular files there are in the
# Pictures directory and how much disk space they use. It should also show the
# sizes and names of the 3 largest files in that directory.

echo -n "The ~/Pictures directory contains "
find ~/Pictures -type f | wc -l
echo "files."

echo -n "The Pictures directory uses "
du -sh ~/Pictures | awk '{print $1}'
echo ""

echo "The ~/Pictures directory's three largest files are:"
echo "--------------------------------------------------------"
du -h ~/Pictures/* | sort -h | tail -3

