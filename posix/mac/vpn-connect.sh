#!/bin/sh

# Connect to Nokia VPN

if [ "$1" = "-v" ]; then
  set -x
fi

# Unmount network drives
unMount() {
  (mount -t smbfs; mount -t fusefs; mount -t webdav) | \
  while read remote on local etc; do
    sudo umount -f $local
  done
}

unMount
/usr/local/bin/restartvpn
/Applications/Internet/VPNClient.app/Contents/MacOS/VPNClient -c "Nokia Aruba"
unMount
sudo /usr/local/bin/mountmyall
