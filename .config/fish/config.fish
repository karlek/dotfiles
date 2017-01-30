# XDG fixes
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_RUNETIME_DIR "/run/user/"(id -u _)

set -x LESSHISTFILE "$XDG_DATA_HOME/less/history"
set -x LESSKEY "$XDG_CONFIG_HOME/less/keys"
set -x GNUPGHOME "$XDG_CONFIG_HOME/gnupg"
set -x BZRPATH "$XDG_CONFIG_HOME/bazaar"
set -x BZR_PLUGIN_PATH "$XDG_DATA_HOME/bazaar"
set -x BZR_HOME "$XDG_CACHE_HOME/bazaar"
set -x STACK_ROOT "$XDG_DATA_HOME/stack"

mkdir "$XDG_RUNETIME_DIR/urxvt" 2> /dev/null
set -x RXVT_SOCKET "$XDG_RUNTIME_DIR/urxvt/urxvt-"(hostname)

set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
set -x GTK2_RC_FILES "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x GIMP2_DIRECTORY "$XDG_CONFIG_HOME/gimp"
set -x CRAWL_RC "$XDG_CONFIG_HOME/crawl/crawlrc"
set -x WINEPREFIX "$XDG_DATA_HOME/wine"
set -x CRAWL_DIR "$XDG_DATA_HOME/crawl/"
set -x RANDFILE "$XDG_DATA_HOME/openssl/rnd"
# Add decimals to math.
set -x BC_ENV_ARGS $XDG_CONFIG_HOME/bc/config

mkdir "$XDG_RUNETIME_DIR/X" 2> /dev/null
touch "$XDG_RUNETIME_DIR/X/authority" 2> /dev/null
set -x XAUTHORITY "$XDG_RUNTIME_DIR/X/authority"
alias tmux='tmux -2 -f $XDG_CONFIG_HOME/tmux/tmux.conf'
alias startx="startx $XDG_CONFIG_HOME/X/initrc 2> $XDG_DATA_HOME/X/startx.log"
alias mutt='mutt -F $XDG_CONFIG_HOME/mutt/muttrc'
alias grc='grc '
alias sqlite3='sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqlite.rc'
alias s3cmd='s3cmd --config=$XDG_CONFIG_HOME/s3/config'
alias irssi='irssi --home=$XDG_CONFIG_HOME/irssi'
alias weechat='weechat -d $XDG_CONFIG_HOME/weechat'
alias irc='mosh laputa -- fish -c "tmux attach -d -t weechat; or tmux"'
set -x GDBHISTFILE $XDG_DATA_HOME/gdb/history
alias gdb='gdb -nh -x $XDG_CONFIG_HOME/gdb/init'

# Needed to activate autojump.
source /usr/share/fish/completions/autojump.fish

# Set environment variables.
set -x GOPATH "$HOME/go/privgo"
set -x GOROOT "$HOME/go/go"
set -x GOROOT_BOOTSTRAP "$HOME/go/go1.4"
set -x EDITOR nvim
set -x BROWSER firefox
set -x STEAM_RUNTIME 1

function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

prepend_to_path $GOROOT/bin
prepend_to_path $GOPATH/bin
prepend_to_path ~/.local/bin
prepend_to_path /usr/bin/core_perl
prepend_to_path ~/sh

# Set locale.
set -x LC_ALL "en_US.UTF-8"

# Pretty man pages <3
set -x LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -x LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -x LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -x LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -x LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -x LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline

# Keybindings in fish.
function fish_user_key_bindings
    # Alt+l : print the file contents of the current folder.
    bind \el 'echo; and ls; and commandline -f repaint'

    # Alt+a : print the file (hidden included) contents of the current folder.
    bind \ea 'echo; and ls -a; and commandline -f repaint'

    # Alt+. : insert last argument from the last command.
    bind \e. 'history-token-search-backward'

    # Alt+1 : pipe to xin
    bind \e1 'commandline -i "| xin"'

    # Alt+2 : pipe stderr to stdout
    bind \e2 'commandline -i "2>&1"'

   # Alt+3 : pipe to /dev/null
    bind \e3 'commandline -i "2> /dev/null"'
end

# Remove greeting.
set fish_greeting ""

# Cleaner git.
alias git='hub'

# Serve folder on port 8000.
alias serve='/bin/sh -c "(cd $argv[1] && python -m http.server)"'

# Update Xresources.
alias xup="xrdb ~/.config/X/resources"

# Folder aliases.
alias -='cd -'
alias ...='cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'

# Calendar start on monday.
alias cal="cal -m"

# Interactive copy and move (ask before overwritting files).
alias cp='cp -i'
alias mv='mv -i'

# Colorized and better syntax for diff.
alias diff='colordiff -u'

# Colorized df.
alias df='grc df'

# Colorized nmap.
alias nmap='grc nmap'

# Colored go output.
alias go='colorgo'

# Colored ping
alias ping='grc ping'

# Colored grep.
alias grep='grep --color=auto'

# Fix coloring for less.
alias less='less -R'

# Colored ls, (--classify) append '/' to directories, (-X) sort alphabetically,
# (-v) natural sort of numbers.
alias ls='ls --color=auto --classify -X -v'

# Colored `go test`.
alias gotest='go test -v . | sed ''/PASS/s//(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//(printf "\033[31mFAIL\033[0m")/'''

# Colorized cat (will guess file type based on contents)
alias ccat 'pygmentize -g'

# Sort packages by size
alias pacbig="expac -H M '%m\t%n' | sort -h"
alias pacexp='pacman -Qqe'

# Trash-put to ~/.local/share/Trash/files.
alias rm="trash-put -- "

# stdin to clipboard.
alias xin='xclip -in -selection clip'
alias xout='xclip -out'

# Pong, reverse dns: `rdns <ip>` and my local ip.
alias pong='ping 8.8.8.8'
alias rdns='dig +short -x'
alias myip='ip route list | grep -o -P "src\s([0-9]{1,3}.){3}[0-9]{1,3}" | head -n1 | cut -c 5-'

# Search for packages
alias pss='pacaur -Ss'

# No screen-saver
alias no-ss='xset -dpms s off'

# Date and battery
alias a='grc a'

alias xidel='xidel --color=always'
alias suspend='systemctl suspend'

# Cleaner output.
alias time='time -p'

# Shortcuts for acpi, date, etc.
alias yt='youtube-dl'
alias musb='mount /mnt'
# alias m='mpv --script=~/.mpv/skipchapters.lua .'

function m
    if count $argv > /dev/null
    	mpv --script=~/.mpv/skipchapters.lua $argv
    else
    	mpv --script=~/.mpv/skipchapters.lua .
    end
end

alias subl='subl3'
function z
  zathura $argv &; exit
end

# View images in current directory.
function v
    if count $argv > /dev/null
    	viewnior --fullscreen $argv
    else
	   viewnior --fullscreen .
    end
end

# File sizes in current directory.
function duf
    if count $argv > /dev/null
        du -h --max-depth=1 $argv | sort -h
    else
        du -h --max-depth=1 . | sort -h
    end
end

# Sort by occurrences, use: `command | nums`
function nums
    awk '{!seen[$0]++};END{for(i in seen) print seen[i] " " i}' | sort -nr
end

# Screen cast.
alias cast='ffmpeg -f x11grab -video_size 2560x1440 -i :0 -f alsa -i default -c:v ffvhuff -c:a flac test.mkv'

function c
	gcalcli --monday --military --nodetail_all -w (echo "$COLUMNS 23" | awk '{print int(($1/$2) * 3)}') calw
end
# Good to know.
### Record macro & play macro.
# xmacrorec2 > testing.macro
# cat testing.macro | xmacroplay ":0.0"

# File type completions 
complete -x -c z -d 'PDF' -a '(__fish_complete_suffix .pdf)'
complete -x -c zathura -d 'PDF' -a '(__fish_complete_suffix .pdf)'
complete -x -c evince -d 'PDF' -a '(__fish_complete_suffix .pdf)'

fish_default_key_bindings
fish_user_key_bindings

alias gs='git status'
alias ga='git add'
alias gc='git commit --gpg-sign --message'
alias gap='git add -p'
alias gp='git push'
