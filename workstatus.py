#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import csv,os,datetime

with open(os.path.join('data','workstatus.csv'),'rb') as csvfile:
    reader = csv.reader(csvfile)

    fmt = "%Y-%m-%dT%H:%M:%S"
    (scale,passedtimestr,color) = tuple(list(reader)[0][1:4])
    scale = int(scale)
    passedtime = datetime.datetime.strptime(passedtimestr,fmt)
    timediff = datetime.datetime.now()-passedtime
    passedminutes = (timediff.seconds)/60+timediff.days*24*60
    bar = "▮"*(passedminutes/scale)
    print '%s: <fc=%s>%s</fc>'% (scale,color,bar)
