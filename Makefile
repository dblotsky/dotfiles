FILES = \
	.bash_profile \
	.bashrc \
	.git-completion.sh \
	.git-ps1.sh \
	.gitconfig \
	.gitignore_global \
	.inputrc \
	.jump.sh \
	.profile \
	.vimrc \
	.virtualenv_config.sh \
	.zprofile \
	.zshrc \

LINKS = $(addprefix $(HOME)/,$(FILES))

default all: link

link: $(LINKS)

$(HOME)/%:
	ln -s $(PWD)/$* $(HOME)
