#!/bin/bash

echo "create lab.conf"
touch lab.conf

echo "create all startup"

files=(as1r1 as1r2 as1r3 as1r2 as2r1 as3r1 as4r1 as5r1 as6r1 as6r2 as6r3 as6r4)

for i in ${files[@]}; do
    echo "ifconfig eth0 X.X.X.X/X up" >> $i.startup
    echo "/etc/init.d/frr start" >> $i.startup
done

echo "create config"

for i in ${files[@]}; do
    mkdir -p $i/etc/frr
    touch $i/etc/frr/daemons
    touch $i/etc/frr/frr.conf
    echo "service integrated-vtysh-config" >> $i/etc/frr/vtysh.conf
    echo "hostname $i-frr" >> $i/etc/frr/vtysh.conf
done