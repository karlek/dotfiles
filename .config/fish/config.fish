# Needed to activate autojump.
set -l autojump "/usr/share/fish/completions/autojump.fish"
if test -d $autojump
	source /usr/share/fish/completions/autojump.fish
end

# Good to know.
### Record macro & play macro.
# xmacrorec2 > testing.macro
# cat testing.macro | xmacroplay ":0.0"

fish_default_key_bindings
fish_user_key_bindings
#fish_vi_key_bindings
#fish_hybrid_key_bindings

if status --is-login
	nyfikend -v > /tmp/nyfiken 2> /tmp/nyfiken-error &
	if not tmux has-session -t cmus 2> /dev/null
		tmux new-session -s cmus -d -n cmus -d "/usr/bin/cmus" &
		tmux set-option status off &
	end
end

