#!/bin/bash -x

# This modified script creates an array from the ifconfig output, which contains
# the names of the network interfaces. With those names, it is able to extract the
# ip addresses of the interfaces from ifconfig output. It then displays the
# interface chosen by the user and shows the gateway ip address if specifically
# requested.

declare -a ips
declare -i intIndex ; intIndex=0
declare value

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
                  for x in "${intnames[@]}"
                  do
                   if [[ "$x" == "$2" ]]
                   then
                     value="$2"
                     
                     break
                   fi
                  done
            ;;
            -r | --route ) #user must ask for the gateway route manually
            
            
            
#                  if [[ [${intnames[0]} =~ ^$2$ ]]; then
#                        count="$2"
#                        shift
#                  else
#                   if [[ [${intnames[1]} =~ ^$2$ ]]; then
#                         count="$2"
#                         shift
#                   else
#                    if [[ [${intnames[2]} =~ ^$2$ ]]; then
#                          count="$2"
#                          shift
#                    else
#                          error-Message "couldn't find $givenInt"
#                          exit 2
#                    fi
#                   fi
#                  fi
            ;;
      esac
      shift
done





while [[ $intindex -lt ${#intnames[@]} ]]; do
    ips[$intindex]=`ifconfig ${intnames[$intindex]} | grep 'inet addr' |
                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
                                     
    echo "Interface ${intnames[$intindex]} has address ${ips[$intindex]}"
    intindex=$((intindex + 1))
done





#### The gateway needs to only show if the user has used the -r argument
#
#gateway=`route -n |grep '^0.0.0.0 ' |awk '{print$2}'`
#
#cat <<BLARGH
#Interface ${intnames[0]}'s address is ${ips[0]}.
#Interface ${intnames[1]}'s address is ${ips[1]}.
#
#The default gateway is $gateway.
#BLARGH