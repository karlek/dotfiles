function unstaged
  begin;
    find . -type f | cut -c 3-; git ls-files;
  end | sort | uniq -u
end

