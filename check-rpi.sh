#!/bin/bash

DIFF=10
CTR=$DIFF
while [ 1 ]
do
    STR="$(curl -vs -o /dev/null 192.168.1.6 2>&1 | grep "< HTTP")"
    if [[ -n $(echo $STR | grep '200') ]]; then
        echo "OK $CTR"
    elif [[ -n "$(echo $STR | grep '404')" ]]; then
        echo "OH NOES!!!!!!!!!!!!!!!!!!!!!!!! $CTR"
    else
        echo "WHAT????????????? $CTR"
    fi
    CTR=$[CTR + $DIFF]
    sleep $DIFF
done
