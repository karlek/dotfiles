set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command 005fd7
set -g fish_color_comment 990000
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end 009900
set -g fish_color_error ff0000
set -g fish_color_escape 00a6b2
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_host_remote yellow
set -g fish_color_normal normal
set -g fish_color_operator 00a6b2
set -g fish_color_param 00afff
set -g fish_color_quote 999900
set -g fish_color_redirection 00afff
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_status red
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

function enable_ayu_theme_light
    set --universal fish_color_autosuggestion 8A9199 # ayu:common.ui        autosuggestions
    set --universal fish_color_command        55B4D4 # ayu:syntax.tag       commands
    set --universal fish_color_comment        ABB0B6 # ayu:syntax.comment   code comments
    set --universal fish_color_cwd            399EE6 # ayu:syntax.entity    current working directory in the default prompt
    set --universal fish_color_end            ED9366 # ayu:syntax.operator  process separators like ';' and '&'
    set --universal fish_color_error          F51818 # ayu:syntax.error     highlight potential errors
    set --universal fish_color_escape         4CBF99 # ayu:syntax.regexp    highlight character escapes like '\n' and '\x70'
    set --universal fish_color_match          F07171 # ayu:syntax.markup    highlight matching parenthesis
    set --universal fish_color_normal         575F66 # ayu:common.fg        default color
    set --universal fish_color_operator       FF9940 # ayu:syntax.accent    parameter expansion operators like '*' and '~'
    set --universal fish_color_param          575F66 # ayu:common.fg        regular command parameters
    set --universal fish_color_quote          86B300 # ayu:syntax.string    quoted blocks of text
    set --universal fish_color_redirection    A37ACC # ayu:syntax.constant  IO redirections
    set --universal fish_color_search_match   --background FF9940 # ayu:syntax.accent    highlight history search matches and the selected pager item (must be a background)
    set --universal fish_color_selection      FF9940 # ayu:syntax.accent    when selecting text (in vi visual mode)

    # color for fish default prompts item
    set --universal fish_color_cancel         FAFAFA # ayu:common.bg        the '^C' indicator on a canceled command
    set --universal fish_color_host           A37ACC # ayu:syntax.constant  current host system in some of fish default prompts
    set --universal fish_color_host_remote    A37ACC # ayu:syntax.constant  current host system in some of fish default prompts, if fish is running remotely (via ssh or similar)
    set --universal fish_color_user           FA8D3E # ayu:syntax.keyword   current username in some of fish default prompts
end

enable_ayu_theme_light
