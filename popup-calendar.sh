#!/bin/sh

BAR_HEIGHT=15  # polybar height
BORDER_SIZE=2  # border size from your wm settings
YAD_WIDTH=222  # 222 is minimum possible value
YAD_HEIGHT=193 # 193 is minimum possible value
DATE="$(date +"%a,%e-%b %H:%M")"

pos_x=-400
pos_y=-100

case "$1" in
--popup)
    yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
        --width=$YAD_WIDTH --height=$YAD_HEIGHT --posx=$pos_x --posy=$pos_y \
        --title="yad-calendar" --borders=0 >/dev/null &
    ;;
*)
    echo "|$DATE|  "
    ;;
esac
