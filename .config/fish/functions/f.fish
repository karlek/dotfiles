function f 
  if count $argv > /dev/null
    feh -B black -. $argv
  else
    feh -B black -. .
  end
end

