# Needed to activate autojump.
set -l autojump "/usr/share/fish/completions/autojump.fish"
if test -d $autojump
	source /usr/share/fish/completions/autojump.fish
end

if status --is-login
	nyfikend -v > /tmp/nyfiken 2> /tmp/nyfiken-error &
	if not tmux has-session -t cmus 2> /dev/null
		tmux new-session -s cmus -d -n cmus -d "/usr/bin/cmus" &
		tmux set-option -t cmus status off &
	end
end

