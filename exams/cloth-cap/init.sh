#!/bin/bash

echo "create lab.conf"
touch lab.conf

echo "create all startup"

files=(as20r1 as20r2 as20r3 as11r1 as12r1 as13r1 as14r1 as10r1)

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
