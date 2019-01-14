# Binge watch, skip openings, endings and previews for all movies in the folder.
function m
	if count $argv > /dev/null
		mpv --script=$XDG_CONFIG_HOME/mpv/skipchapters.lua $argv
	else
		mpv --script=$XDG_CONFIG_HOME/mpv/skipchapters.lua .
	end
end
