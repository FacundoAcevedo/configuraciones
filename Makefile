prefix_app=~/local/bin/
prefix_conf=~/.config/

dotfiles=./dotfiles/
scripts=./local/


seguridad=gnupg2 pinentry-gtk usbguard
entorno=pasystray xautolock i3
aplicaciones=feh owncloud thunderbird firefox
terminal=xsel tmux vim sudo bindfs encfs


install:
	# Configuraciones en directorio de usuario
	install -m 0600 $(dotfiles)/bash_profile ~/.bash_profile
	install -m 0600 $(dotfiles)/bash_aliases ~/.bash_aliases
	install -m 0600 $(dotfiles)/bashrc ~/.bashrc
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
	install -m 0600 ~/.bash_profile $(dotfiles)/bash_profile
	install -m 0600 ~/.bash_aliases $(dotfiles)/bash_aliases
	install -m 0600 ~/.bashrc $(dotfiles)/bashrc
	install -m 0600 ~/.tmux.conf $(dotfiles)/tmux.conf
	## Configuraciones dentro de conf
	#i3
	install -m 0600  $(prefix_conf)/i3/* $(dotfiles)/conf/i3/
	# Scripts
	install -m 0700 $(prefix_app)/* $(scripts)/bin/

install-root:
	# Configuraciones en directorio de usuario
	sudo install -m 0600 -o root -g root $(dotfiles)/bash_profile /root/.bash_profile
	sudo install -m 0600 -o root -g root $(dotfiles)/bash_aliases /root/.bash_aliases
	sudo install -m 0600 -o root -g root $(dotfiles)/bashrc /root/.bashrc
	sudo install -m 0600 -o root -g root $(dotfiles)/tmux.conf /root/.tmux.conf

dependencias:
	# Chequeamos las dependencias
	sudo dnf install -y $(seguridad) $(entorno) $(aplicaciones) $(terminal)


.PHONY: install-root  install absorb dependencias
