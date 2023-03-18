if status is-login
	set TTY (tty)

	set -x WLR_DRM_NO_MODIFIERS 1
	[ "$TTY" = "/dev/tty1" ] && exec sway
end

set -x SSH_AUTH_SOCK /run/user/(id -u)/ssh-agent.$hostname.sock
