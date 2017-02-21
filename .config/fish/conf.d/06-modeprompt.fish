function fish_mode_prompt --description "Display the user mode for the prompt"
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold --background black white
                echo '[N]'
            case insert
                set_color --bold --background black green
                echo '[I]'
            case replace-one
                set_color --bold --background black red
                echo '[R]'
            case visual
                set_color --bold --background magenta white
                echo '[V]'
        end
        set_color normal
        echo -n ' '
    end
end
