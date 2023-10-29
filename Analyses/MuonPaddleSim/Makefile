build_directory := build
install_directory := $(PWD)/install

all:
	ln -sf ../../cformat.sh ./.git/hooks/pre-commit
	cmake . -B$(build_directory) -DCMAKE_INSTALL_PREFIX=$(install_directory)
	cmake --build $(build_directory) -- $(MAKEFLAGS)
	cmake --install $(build_directory) &>/dev/null

clean:
	rm -rf $(build_directory) $(install_directory) eos.sh
