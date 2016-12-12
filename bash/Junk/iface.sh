#!/bin/bash

#Create an array using the output of ifconfig which has the names of
#the network interfaces in it. Use those names to extract the ip 
#addresses of the interfaces, also using ifconfig output. 
#Parse the output of route -n to display the ip address of the default gateway.


declare -a ips
intfindex=0

intnames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)












while [ $intfindex -lt ${#intnames[@]} ]; do
    ips[$intfindex]=`ifconfig ${intnames[$intfindex]} | grep 'inet addr' |
                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
                                     
    echo "Interface ${intnames[$intfindex]} has address ${ips[$intfindex]}"
    intfindex=$((intfindex + 1))
done

gatewayip=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`

cat <<EOF
My default gateway is $gatewayip
EOF