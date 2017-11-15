# Set environment variables.
set -x GOPATH           "$XDG_DATA_HOME/go"
set -x GOROOT           "/usr/lib/go"
set -x EDITOR           "nvim"
set -x BROWSER          "firefox-nightly"
set -x STEAM_RUNTIME    1

# Set locale.
set -x LC_ALL "en_US.UTF-8"

# Remove greeting.
set fish_greeting ""
