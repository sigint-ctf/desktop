#!/bin/sh

# Add 32-bit libraries
dpkg --add-architecture i386
apt-get update
apt-get install -y libstdc++6:i386

# install -y tools
apt-get install -y autoconf automake libtool
apt-get install -y gcc g++

apt-get install -y python2.7

apt-get install -y gdb gdb-multiarch
apt-get install -y strace ltrace
apt-get install -y hexedit

apt-get install -y testdisk foremost
apt-get install -y wireshark

apt-get install -y p7zip-full

mkdir -p /tmp/build/

# Install binwalk 2.0.0
cd /tmp/build/
wget https://github.com/devttys0/binwalk/archive/v2.0.0.tar.gz
tar -xvvzf v2.0.0.tar.gz
cd binwalk-2.0.0/
./configure
make
make install
cd /

rm -r /tmp/build

# Disable xscreensaver
cp /vagrant/configs/xscreensaver /home/vagrant/.xscreensaver
chown vagrant:vagrant /home/vagrant/.xscreensaver

# Install gdb-peda
mkdir -p ~vagrant/tools
[ -d $(eval echo "~vagrant/tools/peda") ] && rm -rf ~vagrant/tools/peda
git clone https://github.com/longld/peda.git ~vagrant/tools/peda
chown -R vagrant:vagrant ~vagrant/tools/
echo "source ~/tools/peda/peda.py" >> ~vagrant/.gdbinit
chown vagrant:vagrant ~vagrant/.gdbinit
