prefix_app=~/local/bin/
prefix_conf=~/.config

dotfiles=./dotfiles
scripts=./local

install:
	# Configuraciones en directorio de usuario
	install -m 0700 $(dotfiles)/bash_profile ~/.bash_profile
	install -m 0600 $(dotfiles)/tmux.conf ~/.tmux.conf
	# Configuraciones dentro de conf
	install -m 0600  $(dotfiles)/conf/i3/* $(prefix_conf)/i3/
	# Scripts
	install -m 0700 $(scripts)/bin/* $(prefix_app)

absorb:


.PHONY: install absorb
