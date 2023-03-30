/**
 * Copyright (c) 2023 Hemashushu <hippospark@gmail.com>, All rights reserved.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 */

#include <stdint.h>
#include "peripherals.h"

void write_char(char c) {
    while(UART0->FR & UART_FR_TXFF);
    UART0->DR = c;
}

void write_string(const char* str) {
    while(*str != '\0') {
        write_char(*str);
        str++;
    }
}

void uart_init(void) {
    /* Disable the UART */
    UART0->CR &= ~UART_CR_UARTEN;

    // for full initialization, check out:
    //
    // - PrimeCell UART (PL011) Technical Reference Manual
    //   https://developer.arm.com/documentation/ddi0183/g
    // - UART driver development
    //   https://github.com/umanovskis/baremetal-arm/blob/master/doc/06_uart.md

    UART0->CR |= UART_CR_UARTEN;
}

int main(void) {
    write_string("hello world\n");
    return 0;
}