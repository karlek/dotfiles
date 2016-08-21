# Tab completion for `go install` command.
function complete_gopath $cmd -d "Completions for the gopath" 
    set cmd "$GOPATH/src/"
    # Remove the real path to "." (i.e. $PWD) from cmd if we're in it
    # so it doesn't get printed in the descriptions
    set -l ind
    if begin; set ind (contains -i -- $PWD $cmd)
              and contains -- "." $cmd
              end
              set -e cmd[$ind]
    end
    for i in $cmd
        set -l desc
        # Don't show description for current directory
        # and replace $HOME with "~"
        # [ $i = "." ]; or set -l desc (string replace -r -- "^$HOME" "~" "$i")
        pushd $i
        for d in (commandline -ct)*/
            # Check if it's accessible - the glob only matches directories
            [ -x $d ]; and printf "%s\t%s\n" $d $desc
        end
        popd
    end
end

complete -f -c go -n '__fish_seen_subcommand_from install' -a '(complete_gopath)'
