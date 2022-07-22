function add_alias $argv
	set -l alias ""
	set -l command ""
	set -l binary ""
	if test (count $argv) = 2
		set binary $argv[1]
		set alias $argv[1]
		set command $argv[2]
	else if test (count $argv) = 3
		set binary $argv[1]
		set alias $argv[2]
		set command $argv[3]
	else
		echo "Bad call to add_alias: [ $argv ]" 1>&2
		return
	end

	which $binary > /dev/null 2> /dev/null
	if test $status -eq 0
		alias $alias=$command
	end
end

# Trash-put to ~/.local/share/Trash/files.
add_alias trash-put rm "trash-put -- "

add_alias nvim vim nvim

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

# Colorized df.
alias df 'df -h'

alias pi="ipython"
alias ip="ip -c"
alias gdb "gdb -q"

# Stdin to clipboard.
alias in 'wl-copy'
# Clipboard to stdout.
alias out 'wl-paste'

# Serve folder on port 8000.
alias serve 'myip; /bin/sh -c "(cd $argv[1] && ~/.local/bin/serve)"'
alias myip 'ip -json route | jq -r ".[] | select(.dst == \"default\") | .prefsrc"'

# Pong, reverse dns: `rdns <ip>` and my local ip.
alias pong 'ping 1.1.1.1'

alias b 'git branch | grep "\*" | cut -c 3-'
alias bm 'echo (git rev-parse --abbrev-ref "master@{upstream}")..(b)'
alias bmr 'echo (b)..(git rev-parse --abbrev-ref "master@{upstream}")'

alias bat="bat --theme OneHalfLight"

function amimullvad
	set -l resp (curl --silent "https://ipv4.am.i.mullvad.net/json" | jq ".mullvad_exit_ip")
	if test "true" = "$resp"
		set_color --bold green; echo "Good"
	else
		set_color --bold --underline red; echo "Bad"
	end
end
