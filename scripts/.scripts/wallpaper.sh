#!/bin/sh

# feh --recursive --randomize --scale-down --bg-scale ~/.wallpaper/* &

# feh --recursive --randomize --scale-down --bg-scale ~/.wallpaper/ &

while true; do
	feh --bg-scale "$(find ~/.wallpaper -type f | sort -R | tail -1)" &
	sleep 15m
done

