# Needed to activate autojump.
set -l autojump "/usr/share/fish/completions/autojump.fish"
if test -d $autojump
	source /usr/share/fish/completions/autojump.fish
end

if status --is-login
	# Initialize runtime files.
	mkdir "$XDG_RUNETIME_DIR/X" 2> /dev/null
	mkdir "$XDG_RUNETIME_DIR/urxvt" 2> /dev/null
	touch "$XDG_RUNETIME_DIR/X/authority" 2> /dev/null

	nyfikend -v > /tmp/nyfiken 2> /tmp/nyfiken-error &
	if not tmux has-session -t cmus 2> /dev/null
		tmux new-session -s cmus -d -n cmus -d "/usr/bin/cmus" &
		tmux set-option -t cmus status off &
	end
end

