#!/bin/bash
rm startup.o
rm main.o
rm main.elf

arm-none-eabi-as -g -o startup.o startup.S

arm-none-eabi-gcc -c \
    -g -Wall -Wextra \
    -o main.o \
    main.c
    # -Os \

arm-none-eabi-ld \
    -o main.elf \
    -T linker.ld \
    startup.o main.o

# arm-none-eabi-gcc \
#     -g -Wall -Wextra \
#     -nostdlib \
#     -nostartfiles \
#     -o main.elf \
#     -T linker.ld \
#     -lgcc \
#     main.c startup.o

arm-none-eabi-size main.elf
