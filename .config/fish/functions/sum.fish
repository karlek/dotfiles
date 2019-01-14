function sum
	awk '{s+=$1} END {print s}'
end
