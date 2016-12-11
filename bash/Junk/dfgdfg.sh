#!/bin/bash
# My first script

read -p "What's the interface bitrate? " interfacebitrate
read -p "What would you like to divide it by? " divisor

echo "$speedinMB=$(( interfacebitrate / divisor ))"