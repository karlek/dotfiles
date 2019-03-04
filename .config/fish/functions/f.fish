function f 
	if count $argv > /dev/null
		# Magick-timeout allows us to open svg files.
		feh --magick-timeout 1 -B black -. $argv
	else
		feh --magick-timeout 1 -B black -. .
	end
end
