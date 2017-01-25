#!/usr/bin/bash 
urxvtc -e fish -c "mutt -F '~/.config/mutt/muttrc' -e 'source ~/.config/mutt/kth.se' '$@'"
