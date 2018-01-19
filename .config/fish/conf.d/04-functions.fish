# Serve folder on port 8000.
alias serve='/bin/sh -c "(cd $argv[1] && python -m http.server)"'

# Colored `go test`.
alias gotest='go test -v . | sed ''/PASS/s//(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//(printf "\033[31mFAIL\033[0m")/'''

# Stdin to clipboard.
alias in='xclip -in -selection clip'
# Clipboard to stdout.
alias xout='xclip -out'

# Pong, reverse dns: `rdns <ip>` and my local ip.
alias pong='ping 8.8.8.8'
add_alias dig rdns 'dig +short -x'
alias myip='ip route list | grep -o -P "src\s([0-9]{1,3}.){3}[0-9]{1,3}" | head -n1 | cut -c 5-'

# Screen-saver setting.
alias no-ss='xset -dpms s off'
alias ss='xset -dpms s on'

alias suspend='systemctl suspend'
alias musb='mount /mnt'

# Date and battery
add_alias grc a 'grc a'

# Sort packages by size
add_alias expac  pacbig   "expac -H M '%m\t%n' | sort -h"
# Export installed packages.
add_alias pacman pacexp   "pacman -Qqett"
add_alias pacman pacclean "sudo pacman -Rs (pacman -Qqtd)"

# Pacaur shortcuts
add_abbr 'pacaur' pa  'pacaur'
add_abbr 'pacaur' pas 'pacaur -Suy'
add_abbr 'pacaur' par 'pacaur -Rns'
add_abbr 'pacaur' pss 'pacaur -Ss'
add_abbr 'pacaur' pql 'pacaur -Ql'

# Git shortcuts
add_abbr 'git' gs  'git status'
add_abbr 'git' ga  'git add'
add_abbr 'git' gap 'git add -p'
add_abbr 'git' gc  'git commit --verbose --gpg-sign'
add_abbr 'git' gp  'git push'
add_abbr 'git' gpu 'git pull'
add_abbr 'git' gb  'git branch'
add_abbr 'git' gd  'git diff'
add_abbr 'git' gl  'git lg'
add_abbr 'git' glp 'git lg -p'
add_abbr 'git' gdc 'git diff --cached'

# Shortcut for ssh.
alias laputa='mosh laputa -- fish -c "tmux new-session -A -t vanilla -s vanilla"'
alias irc='mosh laputa -- fish -c "tmux new-session -A -t weechat -s weechat"'

alias vecka='date "+%V"'

# Volume.
add_alias pamixer vol 'printf "%d%% and %s\n" (pamixer 0 --get-volume) (pamixer --get-mute | sed "s/true/mute/" | sed "s/false/voluble/")'

# Screen cast.
alias cast='ffmpeg -f x11grab -video_size 2560x1440 -i :0 -f alsa -i default -c:v ffvhuff -c:a flac test.mkv'

# Binge watch, skip openings, endings and previews for all movies in the folder.
function m
  if count $argv > /dev/null
    mpv --script=$XDG_CONFIG_HOME/mpv/skipchapters.lua $argv
  else
    mpv --script=$XDG_CONFIG_HOME/mpv/skipchapters.lua .
  end
end

# Image viewer
add_alias feh f '.'

# View images in current directory.
function f
  if count $argv > /dev/null
    feh -B black -. $argv
  else
    feh -B black -. .
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

alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"
alias tozero="tr '\n' '\0'"

function last-modified $argv
  find $argv -type f -printf "%T@\t%p\n" | sort -k1 -n --reverse | awk -F'\t' '{print $2}'
end

function oflen
  grep "^.\{$argv\}\$"
end

function urldecode
  php -r "echo urldecode('$argv');"
end

# Sort by occurrences, use: `command | nums`
function nums
  awk '{!seen[$0]++};END{for(i in seen) print seen[i] " " i}' | sort -nr
end

function nfiles
  find . -maxdepth 1 -print0 | xargs -0 -I '{}' sh -c "printf \"%d {}\n\" \$(find '{}' -type f | wc -l)" | sort -n
end

function gcal
  gcalcli --configFolder=$XDG_CONFIG_HOME/gcalcli --monday --military --nodetail_all -w (echo "$COLUMNS 23" | awk '{print int(($1/$2) * 3)}') calw
end

function json
  if count $argv > /dev/null
    aeson-pretty
  else
    aeson-pretty | pygmentize -l json -f terminal256
  end
end

function imgcmp
  compare -metric RMSE $argv[1] $argv[2] NULL:
end

function castyt
	youtube-dl -o - $argv | castnow --quiet -
end

function unstaged
  begin;
    find . -type f | cut -c 3-; git ls-files;
  end | sort | uniq -u
end

function z
  zathura $argv &
  disown; and sleep 1; and exit
end

alias low_qual "find . -iname '*.mp3' -print0 | xargs -0 mp3info -r a -p '%f\t%r\n' | awk -F\t '{if (\$2 <= 128) print \$1}'"
