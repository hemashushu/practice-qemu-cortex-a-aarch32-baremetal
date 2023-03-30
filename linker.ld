ENTRY(_Vectors)

BASE_ADDRESS = 0x60010000;

SECTIONS
{
    . = BASE_ADDRESS;

    .text : {
        startup.o(.vector_table)
        *(.text .text.*)
    }

    .rodata : ALIGN(8)
    {
        *(.rodata .rodata.*)
    }

    .data : ALIGN(8)
    {
        *(.data .data.*)
    }

    _sbss = .;
    .bss : ALIGN(8)
    {
        *(.bss .bss.*)
    }
    _ebss = .;

    /* a 4KB IRQ mode stack */
    /*
    . = ALIGN(8);
    _irq_sstack = .;
    . += 4096;
    _irq_estack = .;
    */

    /* a 4KB supervisor mode stack */
    . = ALIGN(8);
    _sstack = .;
    . += 4096;
    _estack = .;
}