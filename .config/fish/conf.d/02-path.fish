function add_to_path -d "Add the given directory to user's path"
	if test -d $argv
		set -gx fish_user_paths $fish_user_paths $argv
	end
end
add_to_path $GOROOT/bin
add_to_path $GOPATH/bin
add_to_path ~/.local/bin
add_to_path /usr/bin/core_perl
add_to_path ~/sh
