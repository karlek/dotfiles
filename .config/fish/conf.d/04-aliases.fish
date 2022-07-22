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

# Calendar start on monday.
alias cal "cal -m"

# Colored grep.
alias grep 'grep --color=auto'

# Fix coloring for less.
alias less 'less -R'

# Colorized and better syntax for diff.
alias diff 'diff --color=auto -u'

# Colored pup
add_alias pup 'pup --color'

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

add_alias nvim vim nvim

add_alias stack ghci 'stack exec ghci'

# XQuery selector.
add_alias xidel 'xidel --color=always'

# Serve folder on port 8000.
alias serve 'myip; /bin/sh -c "(cd $argv[1] && ~/.local/bin/serve)"'

# Strip file extensions.
alias stripext "sed 's/\.[^.]*\$//'"

# Colored `go test`.
alias gotest 'go test -v . | sed ''/PASS/s//(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//(printf "\033[31mFAIL\033[0m")/'''

# Stdin to clipboard.
alias in 'wl-copy'
# Clipboard to stdout.
alias xout 'wl-paste'

# Pong, reverse dns: `rdns <ip>` and my local ip.
alias pong 'ping 1.1.1.1'
add_alias dig rdns 'dig +short -x'
alias myip 'ip route list | grep -o -P "src\s([0-9]{1,3}.){3}[0-9]{1,3}" | head -n1 | cut -c 5-'

# Screen-saver setting.
alias no-ss 'xset -dpms s off'
alias ss 'xset -dpms s on'

alias suspend 'systemctl suspend'
alias musb 'mount /mnt'

# Date and battery
add_alias grc a 'grc a'

# Sort packages by size
add_alias expac  pacbig   "expac -H M '%m\t%n' | sort -h"
# Export installed packages.
add_alias pacman pacexp   "pacman -Qqett"
add_alias pacman pacclean "sudo pacman -Rs (pacman -Qqtd)"

# Shortcut for ssh.
alias kobol 'ssh kobol -- tmux new-session -A -s vanilla -t vanilla'
alias irc 'ssh kobol -- tmux new-session -A -s irc -t irc'

alias vecka 'date "+%V"'

# Volume.
add_alias pamixer vol 'printf "%d%% and %s\n" (pamixer 0 --get-volume) (pamixer --get-mute | sed "s/true/mute/" | sed "s/false/voluble/")'

# Screen cast.
alias cast 'ffmpeg -f x11grab -video_size 2560x1440 -i :0 -f alsa -i default -c:v ffvhuff -c:a flac test.mkv'

alias towords "awk '{for(i=1;i<=NF;i++) {print \$i}}'"
alias tolower "tr '[:upper:]' '[:lower:]'"
alias toupper "tr '[:lower:]' '[:upper:]'"
alias tozero "tr '\n' '\0'"

# Find low quality audio mp3 files in all sub-directories.
alias low_qual "find . -iname '*.mp3' -print0 | xargs -0 mp3info -r a -p '%f\t%r\n' | awk -F\t '{if (\$2 <= 128) print \$1}'"

# Muscle memory
add_alias yay pacaur 'yay'

add_alias youtube-dl youtube-playlist 'youtube-dl --playlist-reverse -cwi --download-archive downloaded.txt --no-post-overwrites -o "%(playlist_index)s - %(title)s.%(ext)s"'
alias k kubectl
abbr kc 'k create -f'

alias b 'git branch | grep "\*" | cut -c 3-'
alias bm 'echo (git rev-parse --abbrev-ref "master@{upstream}")..(b)'
alias bmr 'echo (b)..(git rev-parse --abbrev-ref "master@{upstream}")'
alias x 'xrandr --auto'

# Bazelisk
alias bazel bazelisk

alias 64ud 'python -c "import sys; import base64; binary = base64.urlsafe_b64decode(sys.stdin.read() + \'===\'); sys.stdout.buffer.write(binary)"'
alias 64ue 'python -c "import sys; import base64; binary = base64.urlsafe_b64encode(sys.stdin.read().encode(\'utf-8\')); sys.stdout.buffer.write(binary)"'
alias pacbig "pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

function csymbol
	printf $argv[1] | \
	for f in (man -K 2 "$argv[1]" | grep "#include" | grep -Po '(?<=<)[^>]*' | sort -u)
		gcc -include "$f" -E - | \
		grep '#' | \
		awk '{print $3}' | \
		grep -v "<stdin>" | \
		grep -v "<command-line>" | \
		grep -v "built-in" | \
		sort -u | \
		tr -d '"' | \
		xargs -I '{}' ag --heading $argv[1] '{}'
	end
end

function amimullvad
	set -l resp (curl --silent "https://ipv4.am.i.mullvad.net/json" | jq ".mullvad_exit_ip")
	if test "true" = "$resp"
		set_color --bold green; echo "Good"
	else
		set_color --bold --underline red; echo "Bad"
	end
end

function safe-delete-branch
	set --local upstream_branch (git rev-parse --abbrev-ref --symbolic-full-name @{u} | awk -F'/' '{ print $2 }')
	# echo "Upstream: $upstream_branch"

	# Try to delete branches.
	# for target_branch in (git for-each-ref --format='%(refname:short)' refs/heads/)
		# git branch -d $target_branch
	# end

	for target_branch in (git for-each-ref --format='%(refname:short)' refs/heads/)
		if test "$target_branch" = "$upstream_branch"
			continue
		end
		set --local commit_status (git log --oneline --cherry $upstream_branch...$target_branch | grep -v '^=')
		if test (count $commit_status) -eq 0
			echo "Probably safe to delete: $target_branch"
			continue
		end

		# echo "$target_branch"
		# echo (string join \x0a $commit_status)
	end
end

alias bat="bat --theme OneHalfLight"
alias screenshot='grim -g "$(slurp)" - | swappy -f -'
alias listaur='pacman -Qm'

alias pi="ipython"
alias ip="ip -c"

function qrwifi --argument-names pass
	qr "WIFI:S:Casa del Rey;T:WPA2;P:$pass;;"
end
