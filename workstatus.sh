#!/bin/bash

# You need a subdirectory "data" in this directory, where you put a file called
# "workstatus.csv". Fill it with comma-separated data. Example:
#
# 30,,,,
# 0,15,#FFFF00,DENY DESTRUCTIVE CONSTRUCTIVE,xrandr --output eDP1 --gamma 1:1:1; xrandr --output HDMI1 --gamma 1:1:1
# 15,30,#FF0000,,xrandr --output eDP1 --gamma 0.5:0.5:2.0; xrandr --output HDMI1 --gamma 0.5:0.5:2.0


# Current hour and minute
TIME=$(date '+%-H %-M')
HOUR=$(echo $TIME | cut -d' ' -f 1)
MINU=$(echo $TIME | cut -d' ' -f 2)

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
FILE="$SCRIPTPATH/data/workstatus.csv"
CYCLE=$(head -n 1 $FILE | awk -F',' '{ print $1 }')
let "s = (60*$HOUR+$MINU) % $CYCLE"

tail -n +2 $FILE | while read line
do
    A=$(echo $line | awk -F',' '{ print $1 }')
    B=$(echo $line | awk -F',' '{ print $2 }')
    if [ $A -le $s ] && [ $s -lt $B ]; then
        COLOR=$(echo $line | awk -F',' '{ print $3 }')
        MSG=$(echo $line | awk -F',' '{ print $4 }')
        REMAINING=$(($B-$s))
        COMPLETED=$(($B-$A-$REMAINING))
        RBAR=$(printf '▮%.s' $(seq 1 $REMAINING))
        CBAR=$(printf '▯%.s' $(seq 1 $COMPLETED))
        if [ $COMPLETED -eq 0 ]; then
            CBAR=''
            CMD=$(echo $line | awk -F',' '{ print $5 }')
            if [ -n "$CMD" ]; then
                eval $CMD
            fi
        fi
        echo "<fc=$COLOR>$MSG $RBAR</fc><fc=#BBBBBB>$CBAR</fc>"
        break
    fi
done

