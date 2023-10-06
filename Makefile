##
# Dotfiles
#
# @file
# @version 0.1
.PHONY: dir install refresh uninstall

all: dir install

dir:
	mkdir -p -v ~/.config/hypr
	mkdir -p -v ~/.config/alacritty
	mkdir -p -v ~/.config/home-manager
	mkdir -p -v ~/.config/doom
	mkdir -p -v ~/.config/fontconfig
	mkdir -p -v ~/.config/waybar
	mkdir -p -v ~/.config/sanoid
	sudo mkdir -p -v /etc/ly/lang
	sudo mkdir -p -v /etc/yabsnap/configs

install:
	stow -v -t $${HOME} -S hyprland doom alacritty home-manager fontconfig waybar sanoid
	sudo stow -v -t / -S ly yabsnap

uninstall:
	stow -v -t $${HOME} -D hyprland doom alacritty home-manager fontconfig waybar sanoid
	sudo stow -v -t / -D ly yabsnap

refresh:
	stow -v -t $${HOME} -R hyprland doom alacritty home-manager fontconfig waybar sanoid
	sudo stow -v -t / -R ly yabsnap

# end
