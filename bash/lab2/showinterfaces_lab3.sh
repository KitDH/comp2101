#!/bin/bash

# This script creates an array from the ifconfig output, which contains the
# names of the network interfaces. With those names, it is able to extract the
# ip addresses of the interfaces from ifconfig output. It displays the default
# gateway's ip address by parsing the output of route -n.


declare -a ips
intnames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

ips[0]=`ifconfig ${intnames[0]} |grep 'inet addr' |sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
ips[1]=`ifconfig ${intnames[1]} |grep 'inet addr' |sed -e 's/  *inet addr://'| sed -e 's/ .*//'`

gateway=`route -n |grep '^0.0.0.0 ' |awk '{print$2}'`

cat <<BLARGH
Interface ${intnames[0]}'s address is ${ips[0]}.
Interface ${intnames[1]}'s address is ${ips[1]}.

The default gateway is $gateway.
BLARGH