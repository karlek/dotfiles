# Needed to activate autojump.
set -l autojump "/usr/share/fish/completions/autojump.fish"
if test -d $autojump
	source /usr/share/fish/completions/autojump.fish
end

if status --is-login
	# Initialize runtime files.
	mkdir "$XDG_RUNTIME_DIR/X" 2> /dev/null
	mkdir "$XDG_RUNTIME_DIR/urxvt" 2> /dev/null
	touch "$XDG_RUNTIME_DIR/X/authority" 2> /dev/null

	if not test (uname -n) = "elysium"
		exit
	end
	if not tmux has-session -t nyfiken 2> /dev/null
		tmux new-session -d -s nyfiken -n nyfiken "nyfikend -v" &
	end
	if not tmux has-session -t cmus 2> /dev/null
		tmux new-session -d -s cmus -n cmus "cmus" &
		tmux set-option -t cmus status off &
	end
end
