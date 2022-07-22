exit

# Export installed packages.
alias pacman pacexport   "pacman -Qqett"
alias pacman pacclean "sudo pacman -Rs (pacman -Qqtd)"
alias listaur='pacman -Qm'
alias pacbig "pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

alias vecka 'date "+%V"'

alias towords "awk '{for(i=1;i<=NF;i++) {print \$i}}'"
alias tolower "tr '[:upper:]' '[:lower:]'"
alias toupper "tr '[:lower:]' '[:upper:]'"
alias tozero  "tr '\n' '\0'"

alias youtube-dl youtube-playlist 'youtube-dl --playlist-reverse -cwi --download-archive downloaded.txt --no-post-overwrites -o "%(playlist_index)s - %(title)s.%(ext)s"'

alias 64ud 'python -c "import sys; import base64; binary = base64.urlsafe_b64decode(sys.stdin.read() + \'===\'); sys.stdout.buffer.write(binary)"'
alias 64ue 'python -c "import sys; import base64; binary = base64.urlsafe_b64encode(sys.stdin.read().encode(\'utf-8\')); sys.stdout.buffer.write(binary)"'


function qrwifi --argument-names pass
	qr "WIFI:S:Casa del Rey;T:WPA2;P:$pass;;"
end

alias screenshot='grim -g "$(slurp)" - | swappy -f -'

add_abbr spectro spectro 'spectro --local --parallel'
