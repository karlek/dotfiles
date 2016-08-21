#!/bin/bash

# Get a random file from our wallpapers.
files=(/home/_/walls/ghostly/*)
export FILE=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")

hsetroot -fill "$FILE" 2> /dev/null
echo "$FILE" > /tmp/current-wall 
