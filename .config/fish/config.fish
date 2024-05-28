if status is-interactive
	# Commands to run in interactive sessions can go here
end

# --- [ Env ] ---

# Remove greeting.
set fish_greeting ""

set -x XDG_CONFIG_HOME    "$HOME/.config"
set -x XDG_CACHE_HOME     "$HOME/.cache"
set -x XDG_DATA_HOME      "$HOME/.local/share"

set -x LESSHISTFILE       "$XDG_DATA_HOME/less/history"

set -x GOPATH             "$XDG_DATA_HOME/go"
set -x GOROOT             "/usr/lib/go"
set -x EDITOR             "nvim"
set -x BROWSER            "firefox"
set -x MANPAGER           'nvim +Man! +"set nomodifiable"'

# Fix ghidra, burp, all java basically
set -x _JAVA_AWT_WM_NONREPARENTING 1

# Fix `jq` null color issue.
set -x JQ_COLORS "1;35:0"

# Blue grep highlight.
set -x GREP_COLORS "mt=1;34"

set -x LC_TIME "en_GB.UTF-8"
set -x LC_ALL  "en_US.UTF-8"

fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.local/share/go/bin"
fish_add_path "$HOME/.local/share/cargo/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.ghcup/bin"
fish_add_path "$HOME/.pdtm/go/bin"
fish_add_path "$HOME/.nix-profile/bin"

# Fix for pinentry-curses to recognize which tty is being used.
set -gx GPG_TTY (tty)

# --- [ Abbr ] ---

# Pacaur shortcuts
abbr yss 'yay -Ss'
abbr yql 'yay -Ql'

# Git shortcuts
abbr gs   'git status'
abbr gst  'git stash'
abbr gstp 'git stash pop'
abbr ga   'git add'
abbr gaf  'git add -f'
abbr gap  'git add -p'
abbr gc   'git commit --verbose'
abbr gco  'git checkout'
abbr gcop 'git checkout -p'
abbr gcb  'git checkout -b'
abbr gp   'git push'
abbr gpo  'git push origin (b)'
abbr gpb  'git push origin (b)' # Bad..
abbr gpu  'git pull --rebase --autostash --gpg-sign origin master'
abbr gb   'git branch'
abbr gbv  'git branch -v'
abbr gd   'git diff'
abbr gr   'git reset'
abbr grb  'git rebase'
abbr grbc 'git rebase --continue'
abbr grbo 'git rebase "@{u}"'
abbr gl   'git lg'
abbr glp  'git lg -p'
abbr gf   'git fetch'
abbr gfo  'git fetch origin'
abbr gdc  'git diff --cached'
abbr gsw  'git switch'
abbr gswc 'git switch -c'

abbr 64d 'base64 -d'
abbr 64e 'base64'
abbr 0xd 'xxd -r -p'
abbr 0xe 'xxd -p | tr -d "\n"'
abbr pir 'pip install -r requirements.txt'
abbr pvenv 'python3 -m venv .venv'

abbr v   'vim'
abbr r   'reset'
abbr s   'source'
abbr ecn 'echo -n'

# --- [ Alias ]

alias update="source ~/.config/fish/config.fish; echo 'Fish updated ><>'"
alias screenshot='grim -g "$(slurp)" - | swappy -f -'

alias vim nvim

# Folder aliases.
alias ...    'cd ../..'
alias ....   'cd ../../..'
alias .....  'cd ../../../..'
alias ...... 'cd ../../../../..'

# Interactive copy and move (ask before overwritting files).
alias cp 'cp -i'
alias mv 'mv -i'

# Instant reset.
alias reset 'tput reset'

# Colored ls, (--classify) append '/' to directories, (-X) sort alphabetically,
# (-v) natural sort of numbers.
alias ls 'ls --color=auto --classify -X -v --group-directories-first'

# Calendar with weeks.
alias cal "cal -w"

# Colored grep.
alias grep 'grep --color=auto'

# Fix coloring for less.
alias less 'less -R'

# Colorized and better syntax for diff.
alias diff 'diff --color=auto -u'

alias pi="/home/_/.ipython-venv/bin/python3 -m IPython"
alias ip="ip -c"
alias gdb "gdb -q"

# Stdin to clipboard.
alias in 'wl-copy'
# Clipboard to stdout.
alias out 'wl-paste'

# Pong, reverse dns: `rdns <ip>` and my local ip.
alias pong 'ping 1.1.1.1'

alias b 'git branch | grep "\*" | cut -c 3-'
alias bm 'echo (git rev-parse --abbrev-ref "master@{upstream}")..(b)'
alias bmr 'echo (b)..(git rev-parse --abbrev-ref "master@{upstream}")'

function amimullvad
	set -l resp (curl --silent "https://ipv4.am.i.mullvad.net/json" | jq ".mullvad_exit_ip")
	if test "true" = "$resp"
		set_color --bold green; echo "Good"
	else
		set_color --bold --underline red; echo "Bad"
	end
end

# --- [ Prompt ] ---

set __toaster_color_yellow E6DB7E
set __toaster_color_pink F92672
set __toaster_color_grey 554F48
set __toaster_color_white AAAAAA
set __toaster_color_blue 9999FF
set __toaster_color_green 99FF99
set __toaster_color_pipe FFFFFF

function __toaster_color_echo
	set_color $argv[1]
	echo -n $argv[2]
	set_color normal
end

function __toaster_color_echo_bold
	set_color -o $argv[1]
	echo -n $argv[2]
	set_color normal
end

function __toaster_echo_bold
	set_color -o
	echo -n $argv[1]
	set_color normal
end

function __toaster_current_folder
	echo -n $PWD
end

function is_git_folder
	git rev-parse --abbrev-ref HEAD 2> /dev/null > /dev/null
	if test $status -ne 0
		echo 1
		return
	end
	echo 0
end

function __toaster_git_branch
	printf "(%s)" (git rev-parse --abbrev-ref HEAD 2> /dev/null)
end

function fish_prompt
	set -l last_pipestatus $pipestatus
	set -l last_status $status
	# Lazy cat if last command had non-zero return value.
	# Otherwise curious fat cat.
	set -l is_bad (echo -n "$last_pipestatus" | tr -d 0 | string trim | tr -d \n)
	if test -n "$is_bad"
		echo -n "(^-.-^)ノ"
	else
		echo -n "(^._.^)ノ"
	end

	__toaster_color_echo $__toaster_color_blue " "(cat /etc/hostname)
	__toaster_color_echo $__toaster_color_grey " @ "
	__toaster_color_echo $__toaster_color_pink (__toaster_current_folder)
	if test (is_git_folder) -eq 0
		__toaster_color_echo $__toaster_color_grey " : "
		__toaster_color_echo $__toaster_color_blue (__toaster_git_branch)
	end
	if test -n "$is_bad"
		set -l pipe_status (__fish_print_pipestatus '' '' '|' "$(set_color normal)" "$(set_color -o $__toaster_color_pipe)" $last_pipestatus)
		if test -z "$pipe_status"
			set pipe_status (echo -n $last_pipestatus | tr ' ' '|')
			set pipe_status (printf "$(set_color -o $__toaster_color_pipe)%s$(set_color normal)" (string join "$(set_color normal)|$(set_color -o $__toaster_color_pipe)" $last_pipestatus))
		end
		printf " [%s]" "$pipe_status"
	end
	__toaster_color_echo $__toaster_color_grey " \$ "

	# Fix, output color.
	set_color normal
end

# --- [ Keybind ] ---

# Keybindings in fish.
function fish_user_key_bindings
    fish_default_key_bindings

    # Alt+a : print the file (hidden included) contents of the current folder.
    bind \ea 'echo; and ls -a; and commandline -f repaint'

    # Ctrl+delete: remove next word
    bind \e\[3^ 'commandline -f kill-bigword; and commandline -f delete-char'

    # Alt+1 : pipe to in
    bind \e1 'commandline -i "| in"'

    # Alt+2 : pipe to /dev/null
    bind \e2 'commandline -i "2> /dev/null"'

    # Alt+3 : pipe stderr to stdout
    bind \e3 'commandline -i "2>&1"'
end

fish_user_key_bindings

# --- [ Autojump ] ---

set -gx AUTOJUMP_SOURCED 1

# set user installation path
if test -d ~/.autojump
    set -x PATH ~/.autojump/bin $PATH
end

# Set ostype, if not set
if not set -q OSTYPE
    set -gx OSTYPE (bash -c 'echo ${OSTYPE}')
end


# enable tab completion
complete -x -c j -a '(autojump --complete (commandline -t))'


# set error file location
if test -d "$XDG_DATA_HOME"
    set -gx AUTOJUMP_ERROR_PATH $XDG_DATA_HOME/autojump/errors.log
else
    set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
end

if test ! -d (dirname $AUTOJUMP_ERROR_PATH)
    mkdir -p (dirname $AUTOJUMP_ERROR_PATH)
end


# change pwd hook
function __aj_add --on-variable PWD
    status --is-command-substitution; and return
    autojump --add (pwd) >/dev/null 2>>$AUTOJUMP_ERROR_PATH &
end


# misc helper functions
function __aj_err
    # TODO(ting|#247): set error file location
    echo -e $argv 1>&2; false
end

# default autojump command
function j
    switch "$argv"
        case '-*' '--*'
            autojump $argv
        case '*'
            set -l output (autojump $argv)
            # Check for . and attempt a regular cd
            if [ $output = "." ]
                cd $argv
            else
                if test -d "$output"
                    set_color red
                    echo $output
                    set_color normal
                    cd $output
                else
                    __aj_err "autojump: directory '"$argv"' not found"
                    __aj_err "\n$output\n"
                    __aj_err "Try `autojump --help` for more information."
                end
            end
    end
end

# --- [ Misc ] ---

function a
	set -l battery (acpi | cut -c 12-)
	set -l time (date '+%a %b %d, %Y - %T')
	echo $battery
	printf "%40s\n" "$time"
end

function sum
	python -c 'import sys; print(sum([int(l.strip()) for l in sys.stdin.readlines() if l.strip()]))'
end

alias next 'dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next'
alias prev 'dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous'

function deindent
	sed 's#^\s*##'
end

function to-lower
	tr '[:upper:]' '[:lower:]'
end

function dark-mode
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
end

function light-mode
	gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
end

function sj-join
	curl -k -v \
		-H 'User-Agent:' \
		-H 'Referer: https://ombord.sj.se/' \
		'https://10.101.0.1/hotspot/hotspot.cgi?method=login'
end
