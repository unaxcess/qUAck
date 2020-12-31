#!/usr/bin/env bash

set -x
set -e

yum -y install    \
    dos2unix      \
    gcc-c++       \
    openssl-devel \
    mysql-devel   \
    ncurses-devel \
    libffi-devel  \
    zlib-devel \
    make 

dos2unix configure.sh
./configure.sh
make clean
make all

install --mode=0755 ./bin/qUAck /usr/bin/
install --mode=0755 ./bin/qUAckd /usr/bin/

yum clean all
rm -rf /var/cache/yum
