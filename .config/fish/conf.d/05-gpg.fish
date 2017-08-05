# Fix for pinentry-curse to recognize which tty is being used.
set -gx GPG_TTY (tty)
