function nfiles
  find . -maxdepth 1 -print0 | xargs -0 -I '{}' sh -c "printf \"%d {}\n\" \$(find '{}' -type f | wc -l)" | sort -n
end

