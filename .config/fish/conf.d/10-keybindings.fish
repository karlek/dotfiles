# Keybindings in fish.
function fish_user_key_bindings
    fish_default_key_bindings

    # Alt+a : print the file (hidden included) contents of the current folder.
    bind \ea 'echo; and ls -a; and commandline -f repaint'

    # Ctrl+delete: remove next word
    bind \e\[3^ 'commandline -f kill-bigword; and commandline -f delete-char'

    # Alt+1 : pipe to in
    bind \e1 'commandline -i "| in"'

    # Alt+2 : pipe to /dev/null
    bind \e2 'commandline -i "2> /dev/null"'

    # Alt+3 : pipe stderr to stdout
    bind \e3 'commandline -i "2>&1"'
end
fish_user_key_bindings
