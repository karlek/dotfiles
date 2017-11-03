#!/usr/bin/bash

echo "[?] Password for ssh:"
ssh-add

mkdir "$XDG_CACHE_HOME/i3" 2> /dev/null
mkdir "$XDG_DATA_HOME/X" 2> /dev/null

mkdir /tmp/install
curl "https://aur.archlinux.org/cgit/aur.git/snapshot/pacaur.tar.gz" > /tmp/install
cd /tmp/install

   # Lots of packages..

pacaur -S 

acpi                 \ # Show battery
atool                \ # Unpacking tool
compton              \ # Composition manager
dmenu2               \ # Program runner
fish                 \ # Friendly shell <><
fisherman            \ # fish plugins
grc                  \ # Output colorizer
hub                  \ # git wrapper
i3-gaps              \ # wm
mosh                 \ # Lightweight ssh
neovim               \ # Pretty nice editor
lxrandr              \ # Resolution and monitor manager
pavucontrol          \ # Graphical volume management
ponymix              \ # Volume tool
redshift             \ # Redshifting
rxvt-unicode         \ # Terminal emulator
tmux                 \ # Terminal multiplexer
trash-cli            \ # Command line trashcan
ttf-fira-mono        \ # Pretty font <3
unclutter            \ # Hide mouse after a few seconds
urxvt-perls          \ # Plugins for urxvt
xclip                \ # Clipboard tool
xdg-open             \ # Opens files with approriate program
xorg-setxkbmap       \ # Change between keyboard layouts
xorg-xbacklight      \ # Backlight
xorg-xinit           \ # Startx
xautolock            \ # Screen lock after duration
xss-lock             \ # Automatically lock on lid close
caffeine             \ # Keeps screen on when watching videos
zathura              \ # Lightweight PDF reader

	# Dependencies

python-neovim        \ # Dependency for neovim
python2-neovim       \ # Dependency for neovim
xorg-server          \ # Dependency for X
pulseaudio           \ # Audio is nice.
pulseaudio-bluetooth \ # Bluetooth sinks in pulse.
bluez-utils          \ # Bluetoothctl
xinput                 # Fix tracpad scrolling

	# Optional

pacaur -S
cmus                 \ # Music player
tags                 \ # Tag support for vim
go                   \ # Gophers gonna goph'.
jq                   \ # JSON extraction
evince               \ # Heavylifter PDF reader
vim                  \ # Use it for xxd
stack                \ # Haskell
xidel                \ # XQuery based extraction
pup-git              \ # HTML extraction
scrot                \ # Printscreen tool
ripgrep              \ # Search tool
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
