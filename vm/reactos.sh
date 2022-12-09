#!/bin/bash

qemu-system-x86_64 -enable-kvm -smp 2 -m 1G -drive file=~/vm/ReactOS.img,format=raw \
                   -net user 
                   #-cdrom ~/vm/iso/ReactOS-0.4.13.iso \
                   #-boot order=d
