#!/bin/sh
# ref
# https://blog.gaerae.com/2015/01/bash-hello-world.html

# := assign if null 
# :- just check
echo "STR1: ${STR1:="ME"}"
echo "STR2: ${STR2:-"YOU"}"
echo "STR1=$STR1 STR2=$STR2"

# :+
# ${var:+word} # if 'var' is null, return null, else returns 'word'
# MYDIR is not defined || MYDIR=""
echo "flag = ${MYDIR:+1}"
MYDIR="/dk"
echo "flag = ${MYDIR:+1}"

# :?
# ${var:?message} # if 'var' is null, print 'message' with error and exit, else returns 'var' 
: ${YOURDIR:?"print error messge"}
