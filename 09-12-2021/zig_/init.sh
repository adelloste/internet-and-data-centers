#!/bin/bash

echo "create lab.conf"
touch lab.conf

echo "create all startup"

files=(as1 as2r1 as2r2 as3r1 as3r2 as5 as6 as7)

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
