#!/usr/bin/bash

echo "[?] Password for ssh:"
ssh-add

mkdir "$XDG_CACHE_HOME/i3" 2> /dev/null
mkdir "$XDG_DATA_HOME/X" 2> /dev/null

mkdir /tmp/install
curl "https://aur.archlinux.org/cgit/aur.git/snapshot/yay.tar.gz" > /tmp/install
cd /tmp/install

   # Lots of packages..

yay -S

acpi                 \ # Show battery
atool                \ # Unpacking tool

   # Command-line

autojump	     \ # Jumpstyle
bash-completion	     \ # Bash completions, invaluable.
fish                 \ # Friendly shell <><
fisherman            \ # fish plugins
grc                  \ # Output colorizer
hub                  \ # git wrapper
mosh                 \ # Lightweight ssh
neovim               \ # Pretty nice editor
ponymix              \ # Volume tool
rxvt-unicode         \ # Terminal emulator
urxvt-perls          \ # Plugins for urxvt
tmux                 \ # Terminal multiplexer
trash-cli            \ # Command line trashcan
ttf-fira-mono        \ # Pretty font <3
xclip                \ # Clipboard tool
xdg-open             \ # Opens files with approriate program
xorg-setxkbmap       \ # Change between keyboard layouts
xorg-xbacklight      \ # Backlight

        # Security

macchanger	     \ # Change mac-address on startup
xss-lock             \ # Automatically lock on lid close
xautolock            \ # Screen lock after duration

        # UI

caffeine             \ # Keeps screen on when watching videos
compton              \ # Composition manager
dmenu2               \ # Program runner
i3-gaps              \ # wm
lxrandr              \ # Resolution and monitor manager
pavucontrol          \ # Graphical volume management
redshift             \ # Redshifting
unclutter            \ # Hide mouse after a few seconds

	 # GUI

zathura              \ # Lightweight PDF reader

	# Dependencies

python-neovim        \ # Dependency for neovim
python2-neovim       \ # Dependency for neovim
xorg-server          \ # Dependency for X
xorg-xinit           \ # Startx
pulseaudio           \ # Audio is nice.
pulseaudio-bluetooth \ # Bluetooth sinks in pulse.
bluez-utils          \ # Bluetoothctl
xinput                 # Fix tracpad scrolling

	# Japanese keyboard

yay -S
fcitx				 \
fcitx-configtool	 \
fcitx-im			 \
fcitx-mozc			 \
adobe-source-han-sans-jp-fonts


	# Optional

yay -S
cmus                 \ # Music player
tags                 \ # Tag support for vim
go                   \ # Gophers gonna goph'.
evince               \ # Heavylifter PDF reader
vim                  \ # Use it for xxd
stack                \ # Haskell
jq                   \ # JSON extraction
xidel                \ # XQuery based extraction
pup-git              \ # HTML extraction
scrot                \ # Printscreen tool
arch-wiki-docs	     \ # Arch wiki
pulseaudio-alsa        #

# My own programs

echo "[i] Installing nyfiken and colorgo"
go get -u -v github.com/karlek/nyfiken/cmd/nyfikend
go get -u -v github.com/karlek/nyfiken/cmd/nyfiken
go get -u -v github.com/karlek/nyfiken/cmd/colorgo

echo "[i] Installing sflock"
git clone git@github.com:karlek/sflock.git
cd sflock
make
sudo chown root:root sflock
sudo chmod 0000 sflock
sudo chmod +x sflock
sudo chmod +s sflock
sudo mv -i sflock /usr/bin

echo "[u] Enable macspoof for your interface"
echo "sudo systemctl enable macspoof@wlp4s0.service"
