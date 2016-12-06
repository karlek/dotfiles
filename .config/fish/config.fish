# Set environment variables.
set -x GOPATH "$HOME/Desktop/privgo"
set -x GOROOT "$HOME/Desktop/go"
set -x EDITOR vim
set -x BROWSER firefox
set PATH $GOROOT/bin $GOPATH/bin $PATH
set PATH ~/.cabal/bin $PATH
set PATH ~/Desktop/sh $PATH

# Add decimals to math.
set -x BC_ENV_ARGS ~/.bc.cfg

# Set locale.
set -x LC_ALL "en_US.UTF-8"

# Needed to activate autojump.
set fish_plugins autojump

# Theme (which is actually klubbi).
set fish_theme toaster

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
    # Alt+n : print the file contents of the current folder.
    bind \en 'echo; and ls; and commandline -f repaint'

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

# Battery and time check.
alias a='acpi; date'

# Cleaner git.
alias git='hub'

# Serve folder on port 8000.
alias serve='/bin/sh -c "(cd $argv[1] && python -m http.server)"'

# Update Xresources.
alias xup="xrdb ~/.Xresources"

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

# Pong and reverse dns: `rdns <ip>`.
alias pong='ping 8.8.8.8'
alias rdns='dig +short -x'

# Cleaner output.
alias time='time -p'

# Shortcuts for acpi, date, etc.
alias yt='youtube-dl'
alias m='mount /mnt'
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

# Good to know.
### Record macro & play macro.
# xmacrorec2 > testing.macro
# cat testing.macro | xmacroplay ":0.0"

# Login shell.
if status --is-login
    # Start internet on login.
    sudo /home/_/sh/internet.sh > /dev/null &
end
