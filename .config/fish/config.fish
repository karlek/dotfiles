# Customize Oh My Fish configuration path.
# set -gx OMF_CONFIG /home/_/.config/omf

# Path to Oh My Fish install.
# set -gx OMF_PATH /home/_/.local/share/omf
# set -gx GOPATH /home/_/Desktop/privgo
# set -gx GOROOT /home/_/go
# set PATH $PATH $GOPATH/bin

# Set paths
set -x GOPATH "$HOME/Desktop/privgo"
set -x GOROOT "$HOME/go"
set PATH $GOROOT/bin $GOPATH/bin $PATH


# # Fix autojump
# source /etc/profile.d/autojump.fish
# set AUTOJUMP_IGNORE_CASE = 1

# # Load oh-my-fish configuration.
# source $OMF_PATH/init.fish

# Path to your oh-my-fish.
# set fish_path $HOME/.oh-my-fish
# Load oh-my-fish configuration.
# . $fish_path/oh-my-fish.fish


# Needed to activate autojump
set fish_plugins autojump
# Theme
set fish_theme toaster

function fish_user_key_bindings
    # Alt+l : print the file contents of the current folder.
    bind \el 'echo; and ls; and commandline -f repaint'

    # Alt+n : print number of files in folders.
    bind \en 'echo; and nfiles; and commandline -f repaint'

    # Alt+a : print the file (hidden included) contents of the current folder.
    bind \ea 'echo; and ls -a; and commandline -f repaint'

    # Alt+. : insert last argument from the last command.
    bind \e. 'history-token-search-backward'

    # Alt+o : pipe to xin
    bind \eo 'commandline -a "| xin;"'
end

set fish_greeting ""

# Cleaner git.
alias git='hub'

# Serve folder on port 8000.
alias serve='/bin/sh -c "(cd $argv[1] && python -m http.server)"'

# Aliases
alias -='cd -'
alias ...='cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'

# Calendar start on monday.
alias cal="cal -m"

function dur_backend
	if not count $argv > /dev/null
		set -x movies (find . -iname '*.mp4' -o -iname '*.mkv' -o -iname '*.avi' -o -iname '*.mov')
	else
		set -x movies $argv
	end

	for f in $movies
		ffprobe $f 2> /dev/null
		if test $status -eq 1
			continue
		end

		set -x duration (ffprobe $f 2>&1 | grep Duration | cut -c 13- | cut -c -11)
		printf "%s\t%s\n" (basename $f) $duration; 
	end
end

alias dur='dur_backend | expand -t 69,$COLUMNS'

function durshort
    dur_backend $argv | awk -F '\t' '{print $2 "\t" $1}' | sort -n | awk -F '\t' '{print $2 "\t" $1}' | expand -t 69,$COLUMNS
end


# Interactive copy and move (ask before overwritting files).
alias cp='cp -i'
alias mv='mv -i'

# Better diff.
alias diff='colordiff -u'

# Human dmesg
alias dmesg='dmesg -HL'

# Colorized df
alias df='grc df'

# Sort packages by size
alias pacbig="expac -H M '%m\t%n' | sort -h"

# File sizes in current directory.
function duf
    if count $argv > /dev/null
    du -h --max-depth=1 $argv | sort -h
    else
    du -h --max-depth=1 . | sort -h
    end
end

# Colorized nmap
alias nmap='grc nmap'

# Colored go output.
alias go='colorgo'

# Colored grep.
alias grep='grep --color=auto'

# Colored ls, (-F) append '/' to directories, (-X) sort alphabetically, (-v)
# natural sort of numbers.
alias ls='ls --color=auto -F -X -v'

# Colorized cat (will guess file type based on contents)
alias ccat 'pygmentize -g'

# Trash-put to ~/.local/share/Trash/files.
alias rm="trash-put -- "

alias nfiles='find . -maxdepth 1 -print0 | xargs -0 -I "{}" sh -c "echo \$(find \"{}\" -iname \"*.flac\" -o -iname \"*.mp3\" -o -iname \"*.m4a\" | wc -l) \"{}\"" | sort -h'

alias subl='subl3'

# stdin to clipboard.
alias xin='xclip -in -selection clip'
alias xout='xclip -out'

# Cfmt
alias cfmt-test='astyle -t -m1 --pad-header --recursive --dry-run --exclude="chell" --exclude="Makefile" --exclude="README.md" "*"'
alias cfmt='astyle -t -m1 --pad-header --recursive --exclude="chell" --exclude="Makefile" --exclude="README.md" "*"'

# Cleaner output
alias time='time -p'
alias grab='ffmpeg -f x11grab -video_size 2560x1440 -i :0 -f alsa -i default -c:v ffvhuff -c:a flac test.mkv'

# Colored ping
alias ping='grc ping'

alias good_to_know='pacman -Qdttq'

alias list_explicit='pacman -Qet'

# Pong
alias pong='ping 8.8.8.8'
alias rdns='dig +short -x'

# Shortcuts for acpi, date, etc.
alias a='acpi'
alias d='date'
alias m='mount /mnt'
function v
    if count $argv > /dev/null
	viewnior --fullscreen $argv
    else
	viewnior --fullscreen .
    end
end

alias yt='youtube-dl'

# Sort by occurrences
function nums
    awk '{!seen[$0]++};END{for(i in seen) print seen[i] " " i}' | sort -nr
end


# Good to know
### macro
# xmacrorec2 > testing.macro
# cat testing.macro | xmacroplay ":0.0"

# Pretty man pages <3

# Redish
set -x LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -x LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -x LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -x LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -x LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -x LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline

# Fix coloring
alias less='less -R'

# Less Colors for Man Pages (blueish)
# set -x LESS_TERMCAP_mb (printf '\e[01;31m')       # begin blinking
# set -x LESS_TERMCAP_md (printf '\e[01;38;5;74m')  # begin bold
# set -x LESS_TERMCAP_me (printf '\e[0m')           # end mode
# set -x LESS_TERMCAP_se (printf '\e[0m')           # end standout-mode
# set -x LESS_TERMCAP_so (printf '\e[38;5;246m')    # begin standout-mode - info box
# set -x LESS_TERMCAP_ue (printf '\e[0m')           # end underline
# set -x LESS_TERMCAP_us (printf '\e[04;38;5;146m') # begin underline

set -x LC_ALL "en_US.utf-8"

# start X at login
if status --is-login
    sudo /home/_/sh/internet.sh > /dev/null &
    # if test -z "$DISPLAY" -a $XDG_VTNR -eq 1
    #     exec startx -- -keeptty
    # end
end

# Add decimals to math.
set -x BC_ENV_ARGS ~/.bc.cfg

# Autocomplete go install
# complete -f -c go -n '__fish_seen_subcommand_from install' -a '(ls $GOPATH/src)'
#complete -f -c go -n '__fish_seen_subcommand_from install' -a '(find $GOPATH/src -type d | sed "s!$GOPATH/src/!!" | grep -v "\.git" )'

function complete_gopath $cmd -d "Completions for the gopath" 
    set cmd "$GOPATH/src/"
    # Remove the real path to "." (i.e. $PWD) from cmd if we're in it
    # so it doesn't get printed in the descriptions
    set -l ind
    if begin; set ind (contains -i -- $PWD $cmd)
              and contains -- "." $cmd
              end
              set -e cmd[$ind]
    end
    for i in $cmd
        set -l desc
        # Don't show description for current directory
        # and replace $HOME with "~"
        # [ $i = "." ]; or set -l desc (string replace -r -- "^$HOME" "~" "$i")
        pushd $i
        for d in (commandline -ct)*/
            # Check if it's accessible - the glob only matches directories
            [ -x $d ]; and printf "%s\t%s\n" $d $desc
        end
        popd
    end
end

complete -f -c go -n '__fish_seen_subcommand_from install' -a '(complete_gopath)'
alias ad='a; d'
alias gotest='go test -v . | sed ''/PASS/s//(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//(printf "\033[31mFAIL\033[0m")/'''

function asdf
    set -x res (echo $argv | awk '{print $3}')
    # Remove low resolution
    if test (echo $res | awk -F 'x' '{print ($1 < 2560)}') -eq 1
        return
    end
    # Remove non 16:9
    echo $res | awk -F 'x' '{print $1/$2}' | grep -q 1.77778
    if test $status -ne 0
        return
    end
    echo $argv 
end
