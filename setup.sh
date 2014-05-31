#!/bin/sh

# Add 32-bit libraries
dpkg --add-architecture i386
apt-get update
apt-get install -y libstdc++6:i386

# install -y tools
apt-get install -y autoconf automake libtool
apt-get install -y gcc g++ gcc-multilib g++-multilib

apt-get install -y python27

apt-get install -y gdb gdb-multiarch
apt-get install -y strace ltrace
apt-get install -y hexedit

apt-get install -y testdisk foremost
apt-get install -y wireshark


