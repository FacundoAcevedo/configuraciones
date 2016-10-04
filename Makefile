prefix_app=~/local/bin/
prefix_conf=~/.config/

dotfiles=./dotfiles/
scripts=./local/

install:
	# Configuraciones en directorio de usuario
	install -m 0700 $(dotfiles)/bash_profile ~/.bash_profile
	install -m 0700 $(dotfiles)/bashrc ~/.bashrc
	install -m 0600 $(dotfiles)/tmux.conf ~/.tmux.conf
	## Configuraciones dentro de conf
	#i3
	install -m 0600  $(dotfiles)/conf/i3/* $(prefix_conf)/i3/
	chmod  0700 $(prefix_conf)/i3/locker.sh
	# Scripts
	install -m 0700 $(scripts)/bin/* $(prefix_app)

absorb:
	mkdir -p $(dotfiles) $(scripts)
	# Configuraciones en directorio de usuario
	install -m 0700 ~/.bash_profile $(dotfiles)/bash_profile
	install -m 0700 ~/.bashrc $(dotfiles)/bashrc
	install -m 0600 ~/.tmux.conf $(dotfiles)/tmux.conf
	## Configuraciones dentro de conf
	#i3
	install -m 0600  $(prefix_conf)/i3/* $(dotfiles)/conf/i3/
	# Scripts
	install -m 0700 $(prefix_app)/* $(scripts)/bin/


.PHONY: install absorb
