#!/bin/bash
set -xeuo pipefail

mkdir -p ~/local

[ -d ~/.config/awesome/awesome-wm-widgets ] || ( cd ~/.config/awesome/; git clone https://github.com/streetturtle/awesome-wm-widgets.git )

if ! [ -d ~/local/rofi ]; then
	( 
		cd ~/local
		git clone https://github.com/adi1090x/rofi.git
		cd rofi
		chmod +x setup.sh
		./setup.sh
	)

	# https://github.com/o2sh/onefetch/wiki/Installation#ubuntu-ppa
	if ! command -v onefetch; then
		sudo add-apt-repository ppa:o2sh/onefetch
		sudo apt-get update
		sudo apt-get install onefetch
	fi
fi 

# Allow windowed fullscreen with firefox:
# https://www.reddit.com/r/awesomewm/comments/h7fzna/applications_fullscreen_mode_without_taking_whole/
# In Firefox, go to about:config and set full-screen-api.ignore-widgets to true.


if [ -f /etc/debian_version ]; then

	# enable dark mode in Ubuntu
	gsettings set org.gnome.desktop.interface color-scheme prefer-dark

	# install Arc icons (in aur for Arch)
	# used for battery tray 
	if ! [ -d ~/.icons/Arc ]; then
		mkdir -p ~/.icons/Arc
		( 
			cd /tmp
			git clone https://github.com/horst3180/arc-icon-theme.git
			# widget is hard coded to this path, won't detect theme in ~/.icons
			sudo mv arc-icon-theme/Arc /usr/share/icons
		)
	fi
fi
