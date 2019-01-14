# Fix for pinentry-curses to recognize which tty is being used.
set -gx GPG_TTY (tty)
