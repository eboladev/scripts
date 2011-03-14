#!/bin/sh

lock=/var/lock/wvdial.telia

lockfile -r 0 "$lock" || exit 1
trap "rm -f $lock; exit" INT TERM EXIT

ifconfig ppp0 2>/dev/null | grep -q inet.addr && exit
killall wvdial
sleep 2
killall -9 wvdial 2>/dev/null
nohup wvdial >/dev/null 2>&1 &
sleep 5
/etc/init.d/apache2 restart
