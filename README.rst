Zephyr Project Docker Image for ARM boards
==========================================

This docker image makes it easy to get going with building and running apps
based on the Zephyr Project RTOS for ARM boards. It only works on linux!

What's included
---------------

* Based on debian:stretch-backports
* GNU ARM Embedded Toolchain (gcc-arm-none-eabi debian package)
* OpenOCD + gdb for debugging
* qemu-arm-system for running emulated
* dfu-util to download and upload firmware to/from devices connected over USB

Hello World
-----------

1. Clone Zephyr project, this project and download the docker image

.. code-block:: sh

    git clone https://github.com/zephyrproject-rtos/zephyr.git
    git clone https://github.com/agustinhenze/zephyr-arm.git
    docker pull agustinhenze/zephyr-arm

2. Build and run the hello_world example in qemu

.. code-block:: sh

    cd zephyr
    source zephyr-env.sh
    ../zephyr-arm/dockershell
    cd samples/hello_world/
    make BOARD=qemu_cortex_m3 run

and you will get

.. code-block::

	tin@998f04b1a74f:~/zephyr/samples/hello_world$ make BOARD=qemu_cortex_m3 run
	make[1]: Entering directory '/home/tin/zephyr'
	make[2]: Entering directory '/home/tin/zephyr/samples/hello_world/outdir/qemu_cortex_m3'

	CHK     include/generated/generated_dts_board.conf
	Using /home/tin/zephyr as source for kernel
	GEN     ./Makefile
	CHK     include/generated/version.h
	CHK     include/generated/generated_dts_board.h
	CHK     misc/generated/configs.c
	CHK     include/generated/offsets.h
	make[3]: 'isr_tables.o' is up to date.
	To exit from QEMU enter: 'CTRL+a, x'
	[QEMU] CPU: cortex-m3
	***** BOOTING ZEPHYR OS v1.8.99 - BUILD: Jul 12 2017 13:27:06 *****
	Hello World! arm
	QEMU: Terminated
	make[2]: Leaving directory '/home/tin/zephyr/samples/hello_world/outdir/qemu_cortex_m3'
	make[1]: Leaving directory '/home/tin/zephyr'
