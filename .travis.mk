EMAKE_SHA1       ?= d8ab7790f5823547fd4e7aec2218771a3dda0638
PACKAGE_BASENAME := libgit

include emake.mk

libgit2:
	git submodule update --init

build/libegit2.so: libgit2
	mkdir -p build
	cd build && cmake .. -DCMAKE_BUILD_TYPE=Debug && make

test: EMACS_ARGS += -L build/ -l libegit2
test: build/libegit2.so test-ert
