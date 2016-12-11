#!/bin/BASH
# A script that outputs some text to demonstrate the usefulness of variables!!!!

export MYNAME="Kit Dunkley-Hickin"
mytitle="Student Extraordinaire"
myhostname=`hostname`
dayoftheweek=`date +%A`

echo "Welcome to Planet $myhostname, $mytitle $MYNAME!"
echo "Today is $dayoftheweek"