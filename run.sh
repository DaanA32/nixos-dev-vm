#!/bin/bash
# export SHARED_DIR="/home/$USER/git/lp-framework-rs/"
QEMU_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic
