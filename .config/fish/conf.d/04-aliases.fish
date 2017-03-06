# Cleaner git.
alias git='hub'

# Folder aliases.
alias ...='cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'

# Calendar start on monday.
alias cal="cal -m"

# Neovim support
alias vi='vim'
alias vim='nvim'

# Stack ghci
alias ghci='stack ghci'

# Colored ls, (--classify) append '/' to directories, (-X) sort alphabetically,
# (-v) natural sort of numbers.
alias ls='ls --color=auto --classify -X -v'

# Trash-put to ~/.local/share/Trash/files.
which "trash-put" > /dev/null
if test $status -eq 0
	alias rm="trash-put -- "
end

# Interactive copy and move (ask before overwritting files).
alias cp='cp -i'
alias mv='mv -i'

# Colorized and better syntax for diff.
alias diff='diff --color=auto -u'

# Blue grep highlight.
set -x GREP_COLOR "1;34"

# Colorized df.
alias df='grc df -h'

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

alias xidel='xidel --color=always'
alias subl='subl3'

# Cleaner output.
alias time='time -f "\t%e real\t%U user\t%S sys\t%P CPU\t%x status"'

alias mutt='urxvtc -name mutt -e mutt; exit'

alias irc='mosh laputa -- fish -c "tmux attach -d -t weechat; or tmux"'

function unstaged
	begin; 
		find . -type f | cut -c 3-; git ls-files;
	end | sort | uniq -u
end
