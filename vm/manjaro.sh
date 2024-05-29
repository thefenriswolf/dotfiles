#!/bin/bash

sudo qemu-system-x86_64 \
    -enable-kvm \
    -smp 4 -m 6G \
    -hda /dev/zvol/rpool/USERDATA/stefan_ztoylu/vm/manjaro \
    -cdrom ~/vm/iso/manjaro-architect-20.0.3-200607-linux56.iso \
    -boot order=d
