function last-modified
	find $argv -type f -printf "%T@\t%p\n" | sort -k1 -n --reverse | awk -F'\t' '{print $2}'
end
