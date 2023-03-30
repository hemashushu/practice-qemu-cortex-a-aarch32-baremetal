    .syntax unified

/** *************************
 * Vector table
 ************************* */

    .section .vector_table, "x"
    /**
     * flag "x" which followed by ".section" means "executable section",
     * other flags such as "w" indicates "writable section".
     * details:
     * https://sourceware.org/binutils/docs/as/Section.html
     */
    .global _Vectors
_Vectors:
    b       Reset_Handler
    b       .               /* 0x4  Undefined Instruction */
    b       .               /* 0x8  Software Interrupt */
    b       .               /* 0xC  Prefetch Abort */
    b       .               /* 0x10 Data Abort */
    b       .               /* 0x14 Reserved */
    b       .               /* 0x18 IRQ */
    b       .               /* 0x1C FIQ */

/** *************************
 * "function" Reset_Handler
 ************************* */

    .equ    MODE_FIQ, 0x11  /* fast interrupt mode */
    .equ    MODE_IRQ, 0x12  /* normal interrupt mode */
    .equ    MODE_SVC, 0x13  /* supervisor mode, the default mode the processor starts in */

    .section .text
    .global Reset_Handler
Reset_Handler:
    /* set the SP register */
    ldr     sp, =_estack

/**
 * fill stack with 0
 */
fill_stack_zero:
    mov     r0, #0x0
    ldr     r1, =_sstack
1:
    cmp     r1, sp
    strlt   r0, [r1], #4
    blt     1b

/**
 * fill .bss with 0
 */
fill_bss_zero:
    ldr     r1, =_sbss
    ldr     r2, =_ebss
2:
    cmp     r1, r2
    strlt   r0, [r1], #4
    blt     2b

    b   _start

/** *************************
 * "function" _start
 ************************* */

    .global _start
_start:

/* for testing */

    /*
    mov     r0, #0x11
    ldr     r1, =0x22
    ldr     r2, =0x33445566

    movw    r3, #0x5678
    movt    r3, #0x1234

    // `movw r, #y` + `movt r, #x`
    //  = `mov r, #z`
    //  = `ldr r, =z`
    // where z = (x << 16 + y)

    ldr     r4, =dat
    ldr     r5, dat
    */

    bl      main
    b       .

/* for testing
dat:
    .word   0xAABBCCDD
*/

    .end

/**
 * QEMU boot code:
 *
 * => 0x60000000:  mov     r0, #0
 *    0x60000004:  ldr     r1, [pc, #4]    @ 0x60000010
 *    0x60000008:  ldr     r2, [pc, #4]    @ 0x60000014
 *    0x6000000c:  ldr     pc, [pc, #4]    @ 0x60000018
 *
 *    0x60000010:     0x000008e0      0x60000100      0x60010000
 */