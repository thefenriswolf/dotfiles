#!/bin/bash

qemu-system-x86_64 -enable-kvm -smp 2 -m 600M -drive file=~/vm/FreeDOS.raw,format=raw
