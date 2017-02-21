if test (uname) != Darwin
	exit
end

echo "Loading Darwin specific aliases"

# -G colorized
alias ls='ls -G'

# Cleaner output.
alias time='time'

set -x GOROOT /usr/local/opt/go/libexec
