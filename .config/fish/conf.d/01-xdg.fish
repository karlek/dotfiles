# XDG fixes
set -x XDG_CONFIG_HOME    "$HOME/.config"
set -x XDG_CACHE_HOME     "$HOME/.cache"
set -x XDG_DATA_HOME      "$HOME/.local/share"
set -x XDG_RUNTIME_DIR    "/run/user/"(id -u (whoami))

set -x LESSHISTFILE       "$XDG_DATA_HOME/less/history"
set -x LESSKEY            "$XDG_CONFIG_HOME/less/keys"

# Add decimals to math.
set -x BC_ENV_ARGS        "$XDG_CONFIG_HOME/bc/config"
