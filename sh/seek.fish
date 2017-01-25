#!/usr/bin/fish
if test -e /tmp/choke
	exit
end
touch /tmp/choke

set amount 5
set -l duration (cmus-remote -Q | grep duration | awk '{print $2}')
set -l position (cmus-remote -Q | grep position | awk '{print $2}')

set dir ""
if math (count $argv)"==0" > /dev/null
	set dir "for"
else
	set dir $argv[1]
end
switch $dir
	case "rew"
		echo "lool"
		if test (math $position-$amount) -gt 0
			cmus-remote -k (math $position-$amount)
		end
	case "for"
		echo "loll"
		if test (math $position+$amount) -lt $duration
			cmus-remote -k (math $position+$amount)
		end
end
rm /tmp/choke
