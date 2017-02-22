# Keybindings in fish.
function fish_user_key_bindings
    fish_hybrid_key_bindings

    # Alt+l : print the file contents of the current folder.
    bind \el 'echo; and ls; and commandline -f repaint'

    # Alt+a : print the file (hidden included) contents of the current folder.
    bind \ea 'echo; and ls -a; and commandline -f repaint'

    # Alt+. : insert last argument from the last command.
    bind \e. 'history-token-search-backward'

    # Alt+1 : pipe to xin
    bind \e1 'commandline -i "| xin"'

    # Alt+2 : pipe stderr to stdout
    bind \e2 'commandline -i "2>&1"'

    # Alt+3 : pipe to /dev/null
    bind \e3 'commandline -i "2> /dev/null"'
end
