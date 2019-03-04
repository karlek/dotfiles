function nums
	awk '{!seen[$0]++};END{for(i in seen) print seen[i] " " i}' | sort -nr
end
