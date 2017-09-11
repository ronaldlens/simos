#!/bin/sh
set -e
. ./build

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/simos.kernel isodir/boot/simos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "SimOS" {
    multiboot /boot/simos.kernel
}
EOF
grub-mkrescue -o simos.iso isodir
