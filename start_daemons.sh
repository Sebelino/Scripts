#!/bin/bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
python2 "$SCRIPTPATH/daemons/skype_status.py" &

