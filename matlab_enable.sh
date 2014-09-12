MAC=`ifconfig wlp2s0 | grep "ether" | awk '{print $2}'`
modprobe dummy
ip l set dev dummy0 name eth0
ip link set dev eth0 address $MAC
