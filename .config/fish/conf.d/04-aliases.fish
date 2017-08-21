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

function add_abbr $argv
	set -l abbr ""
	set -l command ""
	set -l binary ""
	if test (count $argv) = 2
		set binary $argv[1]
		set abbr $argv[1]
		set command $argv[2]
	else if test (count $argv) = 3
		set binary $argv[1]
		set abbr $argv[2]
		set command $argv[3]
	else
		echo "Bad call to add_abbr: [ $argv ]" 1>&2
		return
	end

	which $binary > /dev/null 2> /dev/null
	if test $status -eq 0
		abbr $abbr $command
	end
end

# Folder aliases.
alias ...    'cd ../..'
alias ....   'cd ../../..'
alias .....  'cd ../../../..'
alias ...... 'cd ../../../../..'

# Interactive copy and move (ask before overwritting files).
alias cp='cp -i'
alias mv='mv -i'

# Instant reset.
alias reset='tput reset'

# Colored ls, (--classify) append '/' to directories, (-X) sort alphabetically,
# (-v) natural sort of numbers.
alias ls='ls --color=auto --classify -X -v'

# Calendar start on monday.
alias cal="cal -m"

# Colored grep.
alias grep='grep --color=auto'

# Fix coloring for less.
alias less='less -R'

# Colorized and better syntax for diff.
alias diff='diff --color=auto -u'

# Cleaner output.
alias time='time -f "\t%e real\t%U user\t%S sys\t%P CPU\t%x status"'

# Colored pup
add_alias pup 'pup --color'

# Stack ghci
add_alias ghci 'stack ghci'

# Cleaner git.
add_alias hub git hub

# Trash-put to ~/.local/share/Trash/files.
add_alias trash-put rm "trash-put -- "

# Colorized df.
add_alias grc df 'grc df -h'

# Colorized nmap.
add_alias grc nmap 'grc nmap'

# Colored ping
add_alias grc ping 'grc ping'

# Colored go output.
add_alias colorgo go colorgo

# XQuery selector.
add_alias xidel 'xidel --color=always'
