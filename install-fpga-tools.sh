#!/bin/bash
dnf -y groupinstall "Development tools"
dnf -y install boost-devel python3-devel python3 mc vim
dnf -y install git cmake clang
dnf -y install dnf-plugins-core
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf -y config-manager --set-enabled PowerTools
dnf -y install boost-python3 boost-python3-devel
dnf -y install graphviz zlib-devel
dnf -y install tcl
dnf -y install tcl-devel
dnf -y install readline-devel bison flex gawk libffi-devel
dnf -y install python3-cairo graphviz pygobject3-devel 
dnf -y install qt5-devel
dnf -y install eigen3-devel.noarch
dnf -y install libusb-devel libftdi-devel
pip3 install xdot

make all
