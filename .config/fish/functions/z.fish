function z
  zathura $argv &
  if test $status -eq 0
    disown; and sleep 1; and exit
  end
end

