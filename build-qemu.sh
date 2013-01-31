#!/bin/sh
. ./config.mk

rm -rf build-qemu
mkdir -p build-qemu
cd build-qemu
wget -c http://wiki.qemu.org/download/qemu-${QV}.tar.bz2
rm -rf qemu-$QV
tar xjvf qemu-${QV}.tar.bz2
cd qemu-$QV
./configure --target-list=${ARCH}-linux-user  --disable-vnc-sasl  --disable-smartcard-nss
make -j 20 LDFLAGS="-static -lrt"
cp -f ${ARCH}-linux-user/qemu-${ARCH} ../base
