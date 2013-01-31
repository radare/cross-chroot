#!/bin/sh
. ./config.mk

[ -n "$1" ] && ARCH="$1"
rm -rf build-qemu
mkdir -p build-qemu
wget -c http://wiki.qemu.org/download/qemu-${QV}.tar.bz2
cd build-qemu
rm -rf qemu-$QV
tar xjvf ../qemu-${QV}.tar.bz2
cd qemu-$QV
patch -p0 < ../../qemu-1.3.1-sstrip.patch
./configure --target-list=${ARCH}-linux-user  --disable-vnc-sasl  --disable-smartcard-nss
make -j 20 LDFLAGS="-static -lrt"
cp -f ${ARCH}-linux-user/qemu-${ARCH} ../../base/shell/
sudo cp -f ../../base/shell/qemu-${ARCH} ../../rootfs/shell
