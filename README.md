# Quick script to install FPGA tools on Centos 8 from scratch

This is intended for Lattice ECP5, but by changing config
values in nextpnr you can add support for other boards.

## HOWTO install on fresh Centos 8 system

Just run in this directory:

    ./install-fpga-tools.sh

This will pull all dependencies, add repos, then build tools one by one that
are not packaged or prepared much for Centos 8.

Then it will clone and build into `/usr/local`:

 * [https://github.com/YosysHQ/prjtrellis](prjtrellis)
 * [https://github.com/YosysHQ/yosys](yosys)
 * [https://github.com/YosysHQ/nextpnr(nextpnr) configured for Lattice ECP5
 * [https://git.code.sf.net/p/openocd/code](openocd) with libftdi support for programming ECP5

## Rebuilding new versions

Depending on tool you want to rebuild, do one of:

    make trellis
    make yosys
    make nextpnr

It will clone the latest master, rebuild and install. Note that trellis is prerequisite for
nextpnr, so you may have to rebuild nextpnr after trellis.

## Minimum of 4 GB RAM is required for nextpnr

nextpnr is built by clang because it won't cause OOM when compiling in 4 GB RAM
environment.

If you have enough RAM, you can add more `-j` to `make` invocation for faster build.

## See also

There are binary builds but fairly outdated:

  * https://github.com/FPGAwars/apio

Though some of them can be still useful if you don't need latest versions.

