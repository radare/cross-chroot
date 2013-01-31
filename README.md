cross-chroot
============

This project provides an easy way to setup chroots from different
architectures like ARM, PowerPC, MIPS, ...

It works by bindings the basic mount points from the real system
and then running qemu-${arch} mixed with chroot to get a working
shell on the target platform.

It was initially named 'mmsdk' as 'minimal maemo sdk', but it is
no longer depending on maemo, so it can run any other distribution
and supports much more CPUs.

how to use it
-------------

1.- Edit 'config.mk' and select 'ARCH' and 'DIST'

2.- Type 'sudo make'.

3.- Enjoy

deprecated notes
----------------

  apt-get update
  cp maemo/bin/true maemo/usr/sbin/dpkg-preconfigure
  apt-get install vim libgtk2.0-dev libhildon1-dev libxml2-dev libsoup2.4-dev

Problem with pango? maybe you have no 
  cp -rf /usr/share/fonts maemo/usr/share/fonts

Wanna full SDK
  apt-get install maemo-sdk-dev
