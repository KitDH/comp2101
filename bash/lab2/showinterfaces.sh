#!/bin/bash

# Creates an array using the output of ifconfig which has the names of the
# network interfaces in it. It uses those names to extract the ip addresses of
# the interfaces, also using ifconfig output. It also parses the output of route
# -n to display the ip address of the default gateway.

declare -a ips

interfacenames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)
ips[0]=`ifconfig ${interfacenames[0]} |grep 'inet addr' |sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
ips[1]=`ifconfig ${interfacenames[1]} |grep 'inet addr' |sed -e 's/  *inet addr://'| sed -e 's/ .*//'`

gatewayip=`route -n |grep '^0.0.0.0 ' |awk '{print$2}'`

cat <<EOF
Interface ${interfacenames[0]} has address ${ips[0]}
Interface ${interfacenames[1]} has address ${ips[1]}

The default gateway is $gatewayip
EOF