#!/bin/bash

qemu-system-x86_64 -enable-kvm -smp 4 -m 2G \
                    -hda /dev/zvol/rpool/USERDATA/stefan_ztoylu/vm/openbsd,format=raw \
                  # -cdrom ~/vm/iso/openbsd67.iso \
                  # -boot order=d
