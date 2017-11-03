#!/usr/bin/fish
# A beautiful term for playing console crawl.
# Requires DejaVu font and rxvt-unicode.
#
# Project lives at https://github.com/jsravn/crawlrc

echo "!! intended for urxvt
crawl*font:               xft:DejaVu Sans Mono:
crawl*vt100.geometry:     80x24
crawl*background:         black
crawl*foreground:         white
crawl*scrollBar:          false
crawl*termName:           rxvt-unicode
crawl*intensityStyles:    true
crawl*letterSpace:        -1
" | xrdb -merge

urxvtc -name crawl -e crawl 

