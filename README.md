# QEMU Cortex-A9 AArch32 Baremetal

QEMU machine _vexpress-a9_

- CoreTile Express A9x4 daughterboard
- Cortex-A9 quad-core MPCore processor
- 1 GB DDR2 SDRAM

Details:

- https://qemu.readthedocs.io/en/latest/system/arm/vexpress.html
- https://github.com/qemu/qemu/blob/60ca584b8af0de525656f959991a440f8c191f12/hw/arm/vexpress.c
- https://developer.arm.com/documentation/dui0448/i

## Build

`$ ./build.sh`

## Run on QEMU

`$ ./run.sh`

A message "hello world" will be shown if there is no error.

Press `Ctrl+x` and then press `a` key to exit QEMU.

## Debug on QEMU

Start QEMU GDB server first:

`$ ./start-gdb-server.sh`

Open another terminal and run the script `start-gdb-client.sh` to enter GDB program:

`$ ./start-gdb-client.sh`

Try to run some GDB commands, e.g.

```gdb
(gdb) b main
Breakpoint 1 at 0x60010154: file main.c, line 39.
(gdb) c
Continuing.

Breakpoint 1, main () at main.c:39
39          write_string("hello world\n");
(gdb) n
40          return 0;
(gdb) n
41      }
```

Enter `q` to exit GDB.

## Debug in the VSCode

Just set a breakpoint on `main.c` and click `Run and Debug` button on the _VSCode_ side bar, then select `Debug (OpenOCD)`.
