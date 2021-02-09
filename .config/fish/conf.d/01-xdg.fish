# XDG fixes
set -x XDG_CONFIG_HOME    "$HOME/.config"
set -x XDG_CACHE_HOME     "$HOME/.cache"
set -x XDG_DATA_HOME      "$HOME/.local/share"
set -x XDG_RUNTIME_DIR    "/run/user/"(id -u (whoami))

set -x LESSHISTFILE       "$XDG_DATA_HOME/less/history"
set -x STACK_ROOT         "$XDG_DATA_HOME/stack"

# Add decimals to math.
set -x BC_ENV_ARGS        "$XDG_CONFIG_HOME/bc/config"

set -x LESSKEY            "$XDG_CONFIG_HOME/less/keys"
set -x GNUPGHOME          "$XDG_CONFIG_HOME/gnupg"
set -x GTK2_RC_FILES      "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -x GIMP2_DIRECTORY    "$XDG_CONFIG_HOME/gimp"

set -x RXVT_SOCKET        "$XDG_RUNTIME_DIR/urxvt/urxvt-"(hostname)
set -x XAUTHORITY         "$XDG_RUNTIME_DIR/X/authority"

set -x R_ENVIRON          "$XDG_CONFIG_HOME/r/environ"
set -x CARGO_HOME         "$XDG_DATA_HOME/cargo"
set -x WINEPREFIX         "$XDG_DATA_HOME/wine"
set -x GDBHISTFILE        "$XDG_DATA_HOME/gdb/history"
set -x RANDFILE           "$XDG_DATA_HOME/openssl/rnd"
set -x PASSWORD_STORE_DIR "$XDG_DATA_HOME/pass"

set -x GEM_HOME           "$XDG_DATA_HOME/gem"
set -x GEM_PATH           $GEM_PATH "$GEM_HOME/bin" "/usr/lib/ruby/gems/2.7.0"
set -x GEMRC              "$XDG_CONFIG_HOME/ruby/gemrc"

alias startx  "startx $XDG_CONFIG_HOME/X/initrc 2> $XDG_DATA_HOME/X/startx.log"
alias tmux    "tmux -2 -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias mutt    "mutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias sqlite3 "sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqlite.rc"
alias s3cmd   "s3cmd --config=$XDG_CONFIG_HOME/s3/config"
alias weechat "weechat -d $XDG_CONFIG_HOME/weechat"
alias gdb     "gdb -nh -x $XDG_CONFIG_HOME/gdb/init"
alias anki    "anki -b $XDG_DATA_HOME/Anki"
alias crawl   "crawl \
				-rcdir $XDG_CONFIG_HOME/crawl \
				-rc $XDG_CONFIG_HOME/crawl/crawlrc \
				-macro $XDG_CONFIG_HOME/crawl/macro \
				-morgue $XDG_DATA_HOME/crawl/morgue \
				-dir $XDG_DATA_HOME/crawl"

# Update Xresources.
alias xup="xrdb ~/.config/X/resources"
