if status is-login
	set -x SSH_AUTH_SOCK /run/user/(id -u)/ssh-agent.$hostname.sock
	ssh-add -l 2> /dev/null > /dev/null
	if test $status -ge 2
		ssh-agent -a "$SSH_AUTH_SOCK" > /dev/null
	end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
