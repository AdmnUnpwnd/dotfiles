#!/bin/sh

# feh --recursive --randomize --scale-down --bg-scale ~/.wallpaper/* &

# feh --recursive --randomize --scale-down --bg-scale ~/.wallpaper/ &

while true; do
	# feh --bg-scale "$(find ~/.wallpaper -type f | sort -R | tail -1)" &
	# feh --bg-max "$(find ~/Documents/Manga/School\ Rumble -type f | sort -R | tail -1)" &
	# feh --bg-max "$(find ~/Documents/Manga/AKB49\ -\ Renai\ Kinshi\ Jourei -type f | sort -R | tail -1)" &
	feh --bg-max "$(find ~/Documents/Manga/ -type f | sort -R | tail -1)" &
	sleep 15m
done

