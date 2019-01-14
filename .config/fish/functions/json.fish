function json
	if count $argv > /dev/null
		aeson-pretty
	else
		aeson-pretty | pygmentize -l json -f terminal256
	end
end
