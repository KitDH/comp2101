#!/bin/bash
#this script prints out Hello World! through a bunchof obfuscated changed to
#what initially seems like gibberish 

echo -n "helb wold" |
      sed -e "s/b/o/g" -e "s/l/ll/" -e "s/ol/orl/" |
      tr "h" "H"|
      tr "w" "W"|
      awk '{print $1 "\x20" $2 "\41"}'
echo ~Done~