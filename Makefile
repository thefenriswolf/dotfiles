##
# Author: Stefan Rohrbacher
# Title: GNU Stow managed dotfiles
# Version: 26.11.2023
##
# Tabs not Spaces!

# begin
# check if running on nixos
#$(eval onNIXOS=`cat /etc/*release | grep 'NAME=NixOS'`)
onNIXOS=$(shell cat /etc/*release | grep 'NAME=NixOS')
usr := hyprland doom alacritty dunst home-manager fontconfig waybar sanoid zsh
sys := ly yabsnap services tuigreet
home=/home/ro/
R='\033[0;31m'   #'0;31' is Red's ANSI color code
G='\033[0;32m'   #'0;32' is Green's ANSI color code
Y='\033[1;32m'   #'1;32' is Yellow's ANSI color code
B='\033[0;34m'   #'0;34' is Blue's ANSI color code
NOCOLOR='\033[0m'     # no color

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
	mkdir -p -v ~/.config/.dunst
	mkdir -p -v ~/.config/sanoid
	mkdir -p -v ~/.config/zsh
	sudo mkdir -p -v /etc/nixos/
ifdef $(onNIXOS)
	sudo mkdir -p -v /etc/ly/lang
	sudo mkdir -p -v /etc/greetd
	sudo mkdir -p -v /etc/yabsnap/configs
else
	echo -e "\n${G}running on NixOS: skipping /etc/*${NOCOLOR}\n"
endif

install:
ifdef $(onNIXOS)
	stow -v -S -t ${home} ${usr}
    sudo stow -v -S -t / ${sys}
else
	echo -e "\n${G}running on NixOS: skipping /etc/*${NOCOLOR}\n"
	stow -v -S -t ${home} ${usr}
endif

uninstall:
ifdef $(onNIXOS)
	sudo stow -v D -t / ${sys}
	stow -v -D -t ${home} ${usr}
else
	echo -e "\n${G}running on NixOS: skipping /etc/*${NOCOLOR}\n"
	stow -v -S -t ${home} ${usr}
endif

refresh:
ifdef $(onNIXOS)
	stow -v -R -t ${home} ${usr}
	sudo stow -v -R -t / ${sys}
else
	stow -v -R -t ${home} ${usr}
	sudo stow -v -R -t / nixos # todo finish for other build steps
	echo -e "\n${G}running on ${B}NixOS${G} skipping non user config packages${NOCOLOR}\n"
endif
# end
