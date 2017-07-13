FROM debian:stretch

# Building dependencies
RUN apt-get update && apt-get install make gcc libc6-dev gcc-arm-none-eabi libnewlib-dev python3-yaml --no-install-recommends -y && rm -rf /var/lib/apt

# Debugging dependencies
RUN apt-get update && apt-get install openocd gdb-arm-none-eabi --no-install-recommends -y && rm -rf /var/lib/apt

# Emulation purpose
RUN apt-get update && apt-get install qemu-system-arm --no-install-recommends -y && rm -rf /var/lib/apt
