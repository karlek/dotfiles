# Set environment variables.
set -x GOPATH           "$XDG_DATA_HOME/go"
set -x GOROOT           "/usr/lib/go"
set -x EDITOR           "nvim"
set -x BROWSER          "firefox"
set -x MANPAGER			'nvim +Man! -M'

# Japanese keyboard.
set -x XMODIFIERS       @im=fcitx
set -x GTK_IM_MODULE    fcitx
set -x QT_IM_MODULE     fcitx

# Set locale.
set -x LC_ALL   "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"

# Remove greeting.
set fish_greeting ""

# Japanese input
set QT_IM_MODULE fcitx
set XMODIFIERS @im=fcitx
set GTK_IM_MODULE fcitx

set -x JQ_COLORS "1;35:0"
