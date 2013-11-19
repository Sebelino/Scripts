#!/bin/bash
SERVICE='/usr/share/eclipse/eclimd'
SERVICEB='/usr/share/eclipse/eclim'
A=$(ps -A | grep eclimd)
B=$(ps -A | grep java)
if [ -n "$A$B" ]; then
    $SERVICEB -command shutdown
    killall eclimd
    killall java
else
    $SERVICE &
fi
