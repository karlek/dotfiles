#!/bin/bash
current=`setxkbmap -query | grep -- layout | awk 'END{print $2}'`
case $current in
	us)
		setxkbmap se
		;;
	*)
		setxkbmap us
		;;
esac
