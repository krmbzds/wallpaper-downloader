#!/bin/sh

# change to directory of this script
cd "$(dirname "$0")"

# load configuration
if [ -e "config.sh" ]; then
	source /mnt/us/extensions/wallpaperdownloader/bin/config.sh
fi

# load utils
if [ -e "utils.sh" ]; then
	source /mnt/us/extensions/wallpaperdownloader/bin/utils.sh
else
	echo "Could not find utils.sh in `pwd`"
	exit
fi

# forever and ever, try to update the wallpaper downloader
logger "Disabling wallpaper downloader auto-update"

stop wallpaperdownloader || true

mntroot rw
rm /etc/upstart/wallpaperdownloader.conf
mntroot ro
