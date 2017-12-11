#!/bin/bash

set -eux

docker run -v $PWD:/opt/littleosbook bellkev/littleosbook-mac make
qemu-system-i386 -D qemu.log -monitor stdio -vga cirrus \
                 -serial file:kernel.log -full-screen \
                 -nodefaults -gdb tcp:0.0.0.0:1234 -cdrom os.iso "$@"
