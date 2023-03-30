#!/bin/bash
arm-none-eabi-gdb main.elf \
    -ex "target extended-remote localhost:1234" \
    -ex "load"

