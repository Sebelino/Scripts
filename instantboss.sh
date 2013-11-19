#!/bin/bash

SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
cat "$SCRIPTPATH/daemons/instantboss2/dat/current_time"
