undock.sh

# Display Port
LEFT=DP-1-6-6

# HDMI
RIGHT=DP-1-5-5

LAPTOP=eDP-1
xrandr --output $LEFT --auto --above $LAPTOP --left-of $RIGHT
xrandr --output $RIGHT --auto --above $LAPTOP --right-of $LEFT
# xrandr --output $LAPTOP --auto --below $LEFT --below $RIGHT
xrandr --output eDP-1 --pos 1600x1440
wallpaper.sh
