#!/bin/bash
echo "Note: press <Ctrl+x>, and then press <a> to exit QEMU"
qemu-system-arm \
    -machine vexpress-a9 \
    -m 32M \
    -no-reboot \
    -nographic \
    -kernel main.elf
