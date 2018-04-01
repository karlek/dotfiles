function duf
  if count $argv > /dev/null
    du --one-file-system -h --max-depth=1 $argv | sort -h
  else
    du --one-file-system -h --max-depth=1 . | sort -h
  end
end

