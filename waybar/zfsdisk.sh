#!/usr/bin/env sh
freespace_root=$(zfs get -H -o value available rpool)
freespace_boot=$(zfs get -H -o value available bpool)
echo "{\"text\":\"$freespace_root\", \"tooltip\":\"$freespace_boot\"}"
exit 0
