#!/bin/bash

echo "create lab.conf"
touch lab.conf

echo "create all startup"

files=(r1 r2 r10 r20 r100 r200)

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
