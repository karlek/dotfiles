function add_to_path -d "Add the given directory to user's path"
        set -U fish_user_paths $fish_user_paths $argv
end
add_to_path $GOROOT/bin
add_to_path $GOPATH/bin
add_to_path ~/.local/bin
add_to_path /usr/bin/core_perl
add_to_path ~/sh
