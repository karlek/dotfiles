# Serve folder on port 8000.
alias serve='/bin/sh -c "(cd $argv[1] && python -m http.server)"'

# Colored `go test`.
alias gotest='go test -v . | sed ''/PASS/s//(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//(printf "\033[31mFAIL\033[0m")/'''

# Colorized cat (will guess file type based on contents)
alias ccat 'pygmentize -g'

# Stdin to clipboard.
alias xin='xclip -in -selection clip'
# Clipboard to stdout.
alias xout='xclip -out'

# Pong, reverse dns: `rdns <ip>` and my local ip.
alias pong='ping 8.8.8.8'
alias rdns='dig +short -x'
alias myip='ip route list | grep -o -P "src\s([0-9]{1,3}.){3}[0-9]{1,3}" | head -n1 | cut -c 5-'

# Screen-saver setting.
alias no-ss='xset -dpms s off'
alias ss='xset -dpms s on'

alias suspend='systemctl suspend'
alias musb='mount /mnt'

# Date and battery
add_alias grc a 'grc a'

# Sort packages by size
alias pacbig="expac -H M '%m\t%n' | sort -h"
# Export installed packages.
alias pacexp='pacman -Qqe'

# Pacaur shortcuts
abbr pa  'pacaur'
abbr pas 'pacaur -Suy'
abbr par 'pacaur -Rns'
abbr pss 'pacaur -Ss'

# Git shortcuts
abbr gs  'git status'
abbr ga  'git add'
abbr gap 'git add -p'
abbr gc  'git commit --verbose --gpg-sign'
abbr gp  'git push'
abbr gd  'git diff'
abbr gl  'git lg'
abbr glp 'git lg -p'
abbr gdc 'git diff --cached'

alias yt='youtube-dl'

# Shortcut for ssh.
alias laputa='mosh laputa -- fish -c "tmux attach -d -t clean; or tmux"'

# Volume.
alias vol='printf "%d%% and %s\n" (pamixer 0 --get-volume) (pamixer --get-mute | sed "s/true/mute/" | sed "s/false/voluble/")'

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

alias tolower="tr '[:upper:]' '[:lower:]'"
alias toupper="tr '[:lower:]' '[:upper:]'"

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

# Sublime text.
add_alias subl3 subl 'subl3'

alias irc='mosh laputa -- fish -c "tmux attach -d -t weechat; or tmux"'

function unstaged
  begin;
    find . -type f | cut -c 3-; git ls-files;
  end | sort | uniq -u
end
