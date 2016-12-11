#!/bin/bash
# This script will grab the VM's public IP address from the icanhazip.com
# service

wget -qO - http://icanhazip.com

# Another way to grab the IP address is with the curl command:
# curl icanhazip.com
