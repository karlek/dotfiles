if test (uname) != Darwin
	exit
end

# -G colorized
alias ls='ls -G'

# Cleaner output.
alias time='time'

# Stdin to clipboard.
alias in='pbcopy'

set -x GOROOT /usr/local/opt/go/libexec
