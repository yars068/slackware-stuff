#!/bin/sh

restore() {
    if [ -f /etc/brightness ]; then
	echo -n "Restoring previous brightness value... "
	cat /etc/brightness > /sys/class/backlight/intel_backlight/brightness && echo "Done."
    fi
}

store() {
    echo -n "Saving current brightness value to /etc/brightness... "
    cat /sys/class/backlight/intel_backlight/brightness > /etc/brightness && echo "Done."
}

case $1 in
      store) store;;
    restore) restore;;
          *) echo "Usage: $0 store | restore"
esac
