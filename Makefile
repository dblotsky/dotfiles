SHELL := /bin/bash

all: submodules link

link: .vim .vimrc .gvimrc .ackrc .gitconfig .screenrc .ctags .gitignore_global .bash_profile jump.bash git-completion.bash virtualenv_config.bash
	$(foreach file, $^, ln -s $(CURDIR)/$(file) ~; )

submodules:
	git submodule init
	git submodule update
