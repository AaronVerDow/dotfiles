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
fi 
