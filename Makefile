.PHONY: tmp trellis yosys nexpnr openocd

TMPDIR = ~/tmp-fpga

all: tmp trellis yosys nextpnr openocd

tmp:
	mkdir -p $(TMPDIR)

trellis: tmp
	cd $(TMPDIR) && \
	rm -rf prjtrellis && \
	git clone --recursive https://github.com/YosysHQ/prjtrellis && \
	cd prjtrellis/libtrellis && \
	cmake -DCMAKE_INSTALL_PREFIX=/usr/local . && \
	make && \
	make install


yosys: tmp
	cd $(TMPDIR) && \
	rm -rf yosys && \
	git clone --recursive https://github.com/YosysHQ/yosys && \
	cd yosys && \
	make config-gcc && \
	make && \
	make install

nextpnr: tmp
	# other locations of trellis need lib argument, e.g.:
	# cmake . -DARCH=ecp5 -DTRELLIS_INSTALL_PREFIX=/opt/trellis/ -DTRELLIS_LIBDIR=/opt/trellis/lib64/trellis -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
	# clang is needed to compile on 4 GB RAM, otherwise it causes OOM
	cd $(TMPDIR) && \
	rm -rf nextpnr && \
	git clone --recursive https://github.com/YosysHQ/nextpnr && \
	cd nextpnr && \
	cmake . -DARCH=ecp5 -DTRELLIS_INSTALL_PREFIX=/usr/local -DTRELLIS_LIBDIR=/usr/local/lib64/trellis -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ && \
	make && \
	make install


openocd: tmp
	cd $(TMPDIR) && \
	rm -rf openocd-code && \
	git clone --recursive https://git.code.sf.net/p/openocd/code openocd-code && \
	cd openocd-code/ && \
	./bootstrap && \
	./configure && make && make install

