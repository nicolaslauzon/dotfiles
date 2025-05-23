#!/bin/bash
revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png

convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png ~/obelix.png -gravity South -geometry -20x1200 /tmp/screen.png

i3lock -i /tmp/screen.png
revert

img=/tmp/i3lock.png

scrot -o $img
convert $img -scale 10% -scale 1000% $img
