#!/bin/sh
exec 1>/tmp/xinit.log 2>&1

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
	xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
	xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
	xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
	xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
		[ -x "$f" ] && . "$f" &
	done
	unset f
fi
# Turn on numlock
# xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96
xset r rate 250 30
# xrandr --output eDP-1-1 --off
# if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then
#     ;
# 	# xrandr --output HDMI-1-2 --auto
# 	# xrandr --output eDP-1-1 --off
# 	# xrandr --output eDP-1 --off
# 	# true
# 	# xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --output eDP-1 --primary --mode 1366x768 --pos 1920x528
# 	# xrandr --output eDP-1-1 --mode 1366x768 --pos 1920x472 --off --output HDMI-1-1 --mode 1366x768 --output DP-1-1 --off --output HDMI-1-2 --mode 1920x1080 --pos 0x0 --rotate normal
# 	# xrandr --output HDMI-1-1 --mode 1366x768
# 	# xrandr --output eDP-1-1 --off
# 	# xrandr --output HDMI-1 --off
# 	# xrandr --output HDMI-1-1 --off
# 	# xrandr --output eDP-1-1 --off
# 	# read -p "Multi-monitor detected, switch off one?" ch
# 	# case $ch in
# 	# 	[Yy*] ) xrandr --output eDP-1 --off ; break ;;
# 	# 	[Nn*] ) ;;
# 	# esac
# fi
export touchID=$(xinput list | grep -i touch | cut -f 2 | cut -d'=' -f 2)
xset r rate 250 30 &
trackBallID=$( (
    xinput list 2>/dev/null
    true
) | grep M570 | cut -f 2 | cut -d'=' -f 2)
xinput set-prop $trackBallID "Coordinate Transformation Matrix" .9 0 0 0 .9 0 0 0 2.5 &
xinput set-prop $trackBallID "libinput Accel Speed" .8 &
xinput set-prop $trackBallID "libinput Middle Emulation Enabled" 1 &


touchID=$( (
    xinput list 2>/dev/null
    true
) | grep TouchPad | cut -f 2 | cut -d'=' -f 2)
xinput set-prop $touchID "libinput Tapping Enabled" 1 &
# xinput set-prop $touchID "libinput Tapping Drag Lock Enabled" 1
xinput set-prop $touchID "libinput Natural Scrolling Enabled" 1 &
# (xinput disable $touchID) &

# remap caps to escape
# (xmodmap -e 'clear Lock' -e 'keycode 0x42=Escape') &


# (xset dpms 0 0 0 && xset s noblank && xset s off) &

systemctl --user start xfce4-notifyd &

# exec awesome > /tmp/awesome.log 2>&1
exec i3 > /tmp/i3.log 2>&1
xset r rate 250 30
# exec qtile > /tmp/qtile.log 2>&1
