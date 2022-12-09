#!/bin/bash

sudo qemu-system-x86_64 \
    -enable-kvm \
    -smp 4 -m 8G \
    -hda /dev/zvol/rpool/USERDATA/stefan_ztoylu/vm/furybsd \
    -cdrom ~/vm/iso/FuryBSD-12.1-XFCE-2020090701.iso \
    -boot order=d
