##
# Author: Stefan Rohrbacher
# Title: GNU Stow managed dotfiles
# Version: 21.10.2023
##
# Tabs not Spaces!

# begin
usr := hyprland doom alacritty home-manager fontconfig waybar sanoid zsh
sys := ly yabsnap services tuigreet

.PHONY: dir install refresh uninstall

all: dir install

dir:
	mkdir -p -v ~/.config/hypr
	mkdir -p -v ~/playground/notes
	mkdir -p -v ~/Zotero/references
	mkdir -p -v ~/.config/alacritty
	mkdir -p -v ~/.config/home-manager
	mkdir -p -v ~/.config/doom
	mkdir -p -v ~/.config/fontconfig
	mkdir -p -v ~/.config/waybar
	mkdir -p -v ~/.config/sanoid
	mkdir -p -v ~/.config/zsh
	sudo mkdir -p -v /etc/ly/lang
	sudo mkdir -p -v /etc/greetd
	sudo mkdir -p -v /etc/yabsnap/configs

install:
	stow -v -t $${HOME} -S ${usr}
	sudo stow -v -t / -S ${sys}
uninstall:
	stow -v -t $${HOME} -D ${usr}
	sudo stow -v -t / -D ${sys}

refresh:
	stow -v -t $${HOME} -R ${usr}
	sudo stow -v -t / -R ${sys}
# end
