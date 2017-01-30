#!/usr/bin/fish

set -l current (cat /tmp/current-wall 2> /dev/null)

set -l files ""

# Get a random file from our wallpapers (except current wallpaper).
if test -z $current
	set files (find ~/Desktop/img/walls -type f)
else
	set files (find ~/Desktop/img/walls -type f | grep -v $current)
end

if test (count $files) -eq 0
	set files (find ~/Desktop/img/walls -type f)
end

set -l file $files[(math 'scale=0;'(random)'%'(count $files)'+1')]

hsetroot -fill "$file"
echo "$file" > /tmp/current-wall
