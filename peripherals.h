// Copyright (c) 2023 Hemashushu <hippospark@gmail.com>, All rights reserved.
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

#ifndef _H_PERIPHERALS
#define _H_PERIPHERALS

#include <stdint.h>

// PrimeCell UART (PL011) Technical Reference Manual
// Summary of registers
// https://developer.arm.com/documentation/ddi0183/g/programmers-model/summary-of-registers
typedef struct
{
    volatile uint32_t DR;               /* 0x0 Data Register */
    volatile uint32_t RSRECR;           /* 0x4 Receive status and error clear register */
    volatile uint32_t _reserved0[4];    /* 0x8 - 0x14 reserved */
    volatile const uint32_t FR;         /* 0x18 Flag register */
    volatile uint32_t _reserved1;       /* 0x1C reserved */
    volatile uint32_t ILPR;             /* 0x20 Low-power counter register */
    volatile uint32_t IBRD;             /* 0x24 Integer baudrate register */
    volatile uint32_t FBRD;             /* 0x28 Fractional baudrate register */
    volatile uint32_t LCRH;             /* 0x2C Line control register */
    volatile uint32_t CR;               /* 0x30 Control register */
} UART_Type;

#define UART0_BASE          (0x10009000UL)
#define UART0               ((UART_Type *)UART0_BASE)

#define UART_FR_BUSY        (1 << 3u)
#define UART_FR_RXFE        (1 << 4u)
#define UART_FR_TXFF        (1 << 5u)

#define UART_CR_UARTEN      (1 << 0u)

#endif