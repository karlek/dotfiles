if contains fish_user_paths_mac (set --names)
	exit
end

function add_to_path -d "Add the given directory to user's path"
	if test -d $argv
		set -gx fish_user_paths $fish_user_paths $argv
	end
end

add_to_path $GOROOT/bin
add_to_path $GOPATH/bin
add_to_path /usr/local/opt/gettext/bin
add_to_path /usr/local/bin
add_to_path /Applications/FirefoxNightly.app/Contents/MacOS

set -gx fish_user_paths_mac true
