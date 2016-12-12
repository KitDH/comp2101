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

while [ $# -gt 0 ]; do
      case "$1" in
            --help )  # matches the help argument
                  expectedArguments
                  exit 0
            ;; 
            -i )  # matches the int name argument
                  if [[ [${intnames[0]} =~ ^$2$ ]]; then
                        count=$2
                        shift
                  else
                   if [[ [${intnames[1]} =~ ^$2$ ]]; then
                         count=$2
                         shift
                   else
                    if [[ [${intnames[2]} =~ ^$2$ ]]; then
                          count=$2
                          shift
                    else
                          error-Message "couldn't find $givenInt"
                          exit 2
                    fi
                   fi
                  fi
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
