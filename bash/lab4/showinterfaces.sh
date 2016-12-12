#!/bin/bash

# This modified script creates an array from the ifconfig output, which contains
# the names of the network interfaces. With those names, it is able to extract the
# ip addresses of the interfaces from ifconfig output. It then displays the
# interface chosen by the user and shows the gateway ip address if specifically
# requested.

declare -a ips
declare -i intIndex ; intIndex=0

intnames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

### Functions
function expectedArguments {
      echo "Usage: $0 [--help] [-i #] [-r (must be specified on command line)]"
}
function error-Message {
    echo "***AHH AN ERROR***: $@" >&2
}

# This section deals with any command-line input the user gives
# Prompts for the user to specify an interfaces are implemented *further below* 

while [ $# -gt  0 ]; do


      case "$1" in
      --help )  # matches the help argument
            expectedArguments
            exit 0
      ;; 
      -i )  # matches the count argument
            if [[ "$2" =~ ^[${intnames[@]}$ ]]; then
                  count=$2
                  shift
            else
                  error-Message "The -c argument needs a number from 1 to 5"
                  exit 2
            fi
      ;;
      -s )  # matches the sides argument
            if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
            if [ "$2" -ge 4 -a "$2" -le 20 ]; then
                  sides=$2
                  shift
            else
                  error-Message "The -s argument needs a number from 4 to 20"
                  exit 2
            fi
            else
                  error-Message "The -s argument needs a number from 4 to 20"
                  exit 2
            fi
      ;;
      * )   # The catch-all case that returns the error function
            expectedArguments
            error-Message "I don't understand '$1'"
            exit 2
      ;;
      esac
      shift
done





while [ $intfindex -lt ${#intnames[@]} ]; do
    ips[$intfindex]=`ifconfig ${intnames[$intfindex]} | grep 'inet addr' |
                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
                                     
    echo "Interface ${intnames[$intfindex]} has address ${ips[$intfindex]}"
    intfindex=$((intfindex + 1))
done





intnames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)
ips[0]=`ifconfig ${intnames[0]} |grep 'inet addr' |sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
ips[1]=`ifconfig ${intnames[1]} |grep 'inet addr' |sed -e 's/  *inet addr://'| sed -e 's/ .*//'`

gateway=`route -n |grep '^0.0.0.0 ' |awk '{print$2}'`

cat <<BLARGH
Interface ${intnames[0]}'s address is ${ips[0]}.
Interface ${intnames[1]}'s address is ${ips[1]}.

The default gateway is $gateway.
BLARGH