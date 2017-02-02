function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

prepend_to_path $GOROOT/bin
prepend_to_path $GOPATH/bin
prepend_to_path ~/.local/bin
prepend_to_path /usr/bin/core_perl
prepend_to_path ~/sh
