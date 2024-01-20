all: reveng.js reveng.wasm

reveng-3.0.5.tar.xz:
	wget https://sourceforge.net/projects/reveng/files/3.0.5/reveng-3.0.5.tar.xz/download -O reveng-3.0.5.tar.xz

download: reveng-3.0.5.tar.xz

build: download
	tar -xf reveng-3.0.5.tar.xz
	(cd reveng-3.0.5 && patch -p1 < ../reveng-emcc.patch)
	make -C reveng-3.0.5

reveng.js: build
	cp reveng-3.0.5/reveng.js reveng.js

reveng.wasm: build
	cp reveng-3.0.5/reveng.wasm reveng.wasm

.PHONY: all build download
