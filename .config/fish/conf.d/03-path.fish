if contains fish_user_paths (set --names)
	exit
end

function add_to_path -d "Add the given directory to user's path"
	if test -d $argv
		set -gx fish_user_paths $fish_user_paths $argv
	end
end
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/sh"
add_to_path "$GEM_PATH"
add_to_path "$GOROOT/bin"
add_to_path "$GOPATH/bin"
add_to_path "$XDG_DATA_HOME/cargo/bin"
