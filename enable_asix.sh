#!/bin/bash

# Execute this script after plugging in the ASUS USB-ethernet adapter.

# Enable kernel module. The interface should now appear in ifconfig.
echo "Loading asix kernel module..."
sudo modprobe asix

# Get the name of the interface.
IFNAME=`iwconfig 2>&1 | grep enp | awk '{print $1;}' | sed 's/://'`
echo "Interface name is: $IFNAME"

sudo ifconfig $IFNAME up
sudo ip link set $IFNAME up
#ip link set $IFNAME down

echo "Done."
