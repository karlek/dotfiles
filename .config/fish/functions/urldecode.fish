function urldecode
	if count $argv > /dev/null
		php -r "echo urldecode('$argv');"
	else
		xargs -I '{}' php -r "echo urldecode('{}');"
	end
end

function urlencode
	if count $argv > /dev/null
		php -r "echo urlencode('$argv');"
	else
		xargs -I '{}' php -r "echo urlencode('{}');"
	end
end
