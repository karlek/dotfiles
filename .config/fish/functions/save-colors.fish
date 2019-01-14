function save-colors
	printf "set -g %s\n" (set -U | grep fish_color) > theme.fish
end
