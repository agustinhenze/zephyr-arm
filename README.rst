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
    mkdir build
    cd build
    cmake -DBOARD=qemu_cortex_m3 ..
    make run

and you will get

.. code-block::

    (0) tin@zephyr-arm-dockershell:~/zephyr/samples/hello_world (master)$ mkdir build; cd build; cmake -DBOARD=qemu_cortex_m3 ..; make run
    CMake Deprecation Warning at /home/tin/zephyr/cmake/app/boilerplate.cmake:47 (cmake_policy):
      The OLD behavior for policy CMP0000 will be removed from a future version
      of CMake.

      The cmake-policies(7) manual explains that the OLD behaviors of all
      policies are deprecated and that a policy should be set to OLD only under
      specific short-term circumstances.  Projects should be ported to the NEW
      behavior and not rely on setting a policy to OLD.
    Call Stack (most recent call first):
      CMakeLists.txt:3 (include)


    -- Found PythonInterp: /usr/bin/python3 (found suitable version "3.5.3", minimum required is "3.4")
    -- Selected BOARD qemu_cortex_m3
    Zephyr version: 1.10.99
    Using /home/tin/zephyr/boards/arm/qemu_cortex_m3/qemu_cortex_m3_defconfig as base
    Merging /home/tin/zephyr/samples/hello_world/prj.conf
    Merging /home/tin/zephyr/tests/include/test.config
    #
    # configuration written to /home/tin/zephyr/samples/hello_world/build/zephyr/.config
    #
    -- Generating zephyr/include/generated/autoconf.h
    -- Generating zephyr/include/generated/generated_dts_board.h
    -- The C compiler identification is GNU 5.4.1
    -- The CXX compiler identification is GNU 5.4.1
    -- The ASM compiler identification is GNU
    -- Found assembler: /usr/bin/arm-none-eabi-gcc
    -- Performing Test toolchain_is_ok
    -- Performing Test toolchain_is_ok - Success
    -- Performing Test check_nostartfiles
    -- Performing Test check_nostartfiles - Success
    -- Performing Test check_nodefaultlibs
    -- Performing Test check_nodefaultlibs - Success
    -- Performing Test check_nostdlib
    -- Performing Test check_nostdlib - Success
    -- Performing Test check_static
    -- Performing Test check_static - Success
    -- Performing Test check_no_pie
    -- Performing Test check_no_pie - Failed
    -- Performing Test check_fno_asynchronous_unwind_tables_C
    -- Performing Test check_fno_asynchronous_unwind_tables_C - Success
    -- Performing Test check_fno_pie_C
    -- Performing Test check_fno_pie_C - Success
    -- Performing Test check_fno_pic_C
    -- Performing Test check_fno_pic_C - Success
    -- Performing Test check_fno_strict_overflow_C
    -- Performing Test check_fno_strict_overflow_C - Success
    -- Performing Test check_Wno_pointer_sign_C
    -- Performing Test check_Wno_pointer_sign_C - Success
    -- Performing Test check_Wno_unused_but_set_variable_C
    -- Performing Test check_Wno_unused_but_set_variable_C - Success
    -- Performing Test check_fno_reorder_functions_C
    -- Performing Test check_fno_reorder_functions_C - Success
    -- Performing Test check_fno_defer_pop_C
    -- Performing Test check_fno_defer_pop_C - Success
    -- Performing Test check_Werror_implicit_int_C
    -- Performing Test check_Werror_implicit_int_C - Success
    -- Performing Test check_Wl__X
    -- Performing Test check_Wl__X - Success
    -- Performing Test check_Wl__N
    -- Performing Test check_Wl__N - Success
    -- Performing Test check_Wl___gc_sections
    -- Performing Test check_Wl___gc_sections - Success
    -- Performing Test check_Wl___build_id_none
    -- Performing Test check_Wl___build_id_none - Success
    -- Performing Test check_ffunction_sections_C
    -- Performing Test check_ffunction_sections_C - Success
    -- Performing Test check_fdata_sections_C
    -- Performing Test check_fdata_sections_C - Success
    -- Performing Test check_Wl___print_memory_usage
    -- Performing Test check_Wl___print_memory_usage - Success
    -- Configuring done
    -- Generating done
    -- Build files have been written to: /home/tin/zephyr/samples/hello_world/build
    Scanning dependencies of target syscall_list_h_target
    [  1%] Generating always_rebuild
    Building for board qemu_cortex_m3
    [  2%] Generating misc/generated/syscalls.json
    [  3%] Generating include/generated/syscall_dispatch.c, include/generated/syscall_list.h
    [  3%] Built target syscall_list_h_target
    Scanning dependencies of target syscall_macros_h_target
    [  4%] Generating include/generated/syscall_macros.h
    [  4%] Built target syscall_macros_h_target
    Scanning dependencies of target offsets
    [  6%] Building C object zephyr/CMakeFiles/offsets.dir/arch/arm/core/offsets/offsets.c.obj
    [  7%] Linking C static library liboffsets.a
    [  7%] Built target offsets
    Scanning dependencies of target offsets_h
    [  8%] Generating include/generated/offsets.h
    [  8%] Built target offsets_h
    Scanning dependencies of target kernel
    [  9%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/alert.c.obj
    [ 11%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/device.c.obj
    [ 12%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/errno.c.obj
    [ 13%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/idle.c.obj
    [ 14%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/init.c.obj
    [ 16%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/mailbox.c.obj
    [ 17%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/mem_slab.c.obj
    [ 18%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/mempool.c.obj
    [ 19%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/msg_q.c.obj
    [ 20%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/mutex.c.obj
    [ 22%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/pipes.c.obj
    [ 23%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/queue.c.obj
    [ 24%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/sched.c.obj
    [ 25%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/sem.c.obj
    [ 27%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/stack.c.obj
    [ 28%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/sys_clock.c.obj
    [ 29%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/system_work_q.c.obj
    [ 30%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/thread.c.obj
    [ 32%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/thread_abort.c.obj
    [ 33%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/version.c.obj
    [ 34%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/work_q.c.obj
    [ 35%] Building C object zephyr/kernel/CMakeFiles/kernel.dir/timer.c.obj
    [ 37%] Linking C static library libkernel.a
    [ 37%] Built target kernel
    Scanning dependencies of target app
    [ 38%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdlib/atoi.c.obj
    [ 39%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdlib/strtol.c.obj
    [ 40%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdlib/strtoul.c.obj
    [ 41%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/string/strncasecmp.c.obj
    [ 43%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/string/strstr.c.obj
    [ 44%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/string/string.c.obj
    [ 45%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdout/prf.c.obj
    [ 46%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdout/stdout_console.c.obj
    [ 48%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdout/sprintf.c.obj
    [ 49%] Building C object CMakeFiles/app.dir/home/tin/zephyr/lib/libc/minimal/source/stdout/fprintf.c.obj
    [ 50%] Building C object CMakeFiles/app.dir/src/main.c.obj
    [ 51%] Linking C static library libapp.a
    [ 51%] Built target app
    Scanning dependencies of target linker_pass2_script
    [ 53%] Generating linker_pass2.cmd
    [ 53%] Built target linker_pass2_script
    Scanning dependencies of target zephyr
    [ 54%] Building C object zephyr/CMakeFiles/zephyr.dir/lib/crc/crc16_sw.c.obj
    [ 55%] Building C object zephyr/CMakeFiles/zephyr.dir/misc/printk.c.obj
    [ 56%] Building C object zephyr/CMakeFiles/zephyr.dir/misc/generated/configs.c.obj
    [ 58%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/common/isr_tables.c.obj
    [ 59%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/soc/ti_lm3s6965/soc.c.obj
    [ 60%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/soc/ti_lm3s6965/soc_config.c.obj
    [ 61%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/exc_exit.S.obj
    [ 62%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/irq_init.c.obj
    [ 64%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/swap.S.obj
    [ 65%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/fault.c.obj
    [ 66%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/irq_manage.c.obj
    [ 67%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/thread.c.obj
    [ 69%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cpu_idle.S.obj
    [ 70%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/fault_s.S.obj
    [ 71%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/fatal.c.obj
    [ 72%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/sys_fatal_error_handler.c.obj
    [ 74%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/thread_abort.c.obj
    [ 75%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/isr_wrapper.S.obj
    [ 76%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/vector_table.S.obj
    [ 77%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/reset.S.obj
    [ 79%] Building ASM object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/nmi_on_reset.S.obj
    [ 80%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/prep_c.c.obj
    [ 81%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/scb.c.obj
    [ 82%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/nmi.c.obj
    [ 83%] Building C object zephyr/CMakeFiles/zephyr.dir/arch/arm/core/cortex_m/exc_manage.c.obj
    [ 85%] Building C object zephyr/CMakeFiles/zephyr.dir/drivers/console/uart_console.c.obj
    [ 86%] Building C object zephyr/CMakeFiles/zephyr.dir/drivers/serial/uart_stellaris.c.obj
    [ 87%] Building C object zephyr/CMakeFiles/zephyr.dir/drivers/timer/sys_clock_init.c.obj
    [ 88%] Building C object zephyr/CMakeFiles/zephyr.dir/drivers/timer/cortex_m_systick.c.obj
    [ 90%] Linking C static library libzephyr.a
    [ 90%] Built target zephyr
    Scanning dependencies of target linker_script
    [ 91%] Generating linker.cmd
    [ 91%] Built target linker_script
    Scanning dependencies of target zephyr_prebuilt
    [ 92%] Building C object zephyr/CMakeFiles/zephyr_prebuilt.dir/misc/empty_file.c.obj
    [ 93%] Linking C executable zephyr_prebuilt.elf
    Memory region         Used Size  Region Size  %age Used
               FLASH:        6656 B       256 KB      2.54%
                SRAM:        3956 B        64 KB      6.04%
            IDT_LIST:          20 B         2 KB      0.98%
    [ 93%] Built target zephyr_prebuilt
    [ 95%] Generating isr_tables.c
    gen_isr_tables.py: (2473, 2877, 34, 0, 0)
    gen_isr_tables.py: spurious handler: 0x9a9
    gen_isr_tables.py: Configured interrupt routing
    gen_isr_tables.py: handler    irq flags param
    gen_isr_tables.py: --------------------------
    Scanning dependencies of target kernel_elf
    [ 96%] Building C object zephyr/CMakeFiles/kernel_elf.dir/misc/empty_file.c.obj
    [ 97%] Building C object zephyr/CMakeFiles/kernel_elf.dir/isr_tables.c.obj
    [ 98%] Linking C executable zephyr.elf
    Generating files from zephyr.elf for board: qemu_cortex_m3
    [ 98%] Built target kernel_elf
    Scanning dependencies of target run
    [100%]
    To exit from QEMU enter: 'CTRL+a, x'
    [QEMU] CPU: cortex-m3
    ***** BOOTING ZEPHYR OS v1.10.99- - BUILD: Jan  2 2018 12:23:05 *****
    Hello World! arm
    QEMU: Terminated
    [100%] Built target run
    (0) tin@zephyr-arm-dockershell:~/zephyr/samples/hello_world/build (master)$
