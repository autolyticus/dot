#!/bin/sh

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
xrandr --output HDMI-1-1 --mode 1600x900
# xrandr --output eDP-1-1 --off
if [ $(xrandr --listmonitors | wc -l) -eq 3 ]; then
	xrandr --output eDP-1-1 --off
	xrandr --output eDP-1 --off
	# true
	# xrandr --output HDMI-1 --mode 1920x1080 --pos 0x0 --output eDP-1 --primary --mode 1366x768 --pos 1920x528
	# xrandr --output eDP-1-1 --mode 1366x768 --pos 1920x472 --off --output HDMI-1-1 --mode 1366x768 --output DP-1-1 --off --output HDMI-1-2 --mode 1920x1080 --pos 0x0 --rotate normal
	# xrandr --output HDMI-1-1 --mode 1366x768
	# xrandr --output eDP-1-1 --off
	# xrandr --output HDMI-1 --off
	# xrandr --output HDMI-1-1 --off
	# xrandr --output eDP-1-1 --off
	# read -p "Multi-monitor detected, switch off one?" ch
	# case $ch in
	# 	[Yy*] ) xrandr --output eDP-1 --off ; break ;;
	# 	[Nn*] ) ;;
	# esac
fi
export touchID=$(xinput list | grep Touchpad | cut -f 2 | cut -d'=' -f 2)
xinput disable $touchID

# remap caps to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42=Escape' #remaps the keyboard so CAPS LOCK=ESC


xset dpms 0 0 0 && xset s noblank && xset s off
(xautolock -time 5 -locker ~/.local/bin/locker -corners +000 -cornerdelay 1 -cornerredelay 5) &

exec awesome > /tmp/awesome.log 2>&1
