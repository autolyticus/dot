#!/usr/bin/env sh

exec 1>/tmp/autostart.log 2>&1

runCommand() {
    pgrep -x "$(echo "$@" | cut -d ' ' -f 1)" ||
    ("$@" > /tmp/"$1.log" 2>&1) &
}

runCommand mpd
runCommand redshift -l 20.5937:78.9629 -t 6500:3000
runCommand conky
runCommand nm-applet
runCommand rescuetime
runCommand numlockx
runCommand i3-alttab
runCommand ckb-next -b
runCommand feh --bg-scale ~/.config/awesome/themes/powerarrow-dark/wall.jpg
runCommand remmina -i
runCommand nextcloud --background
sudo $HOME/.local/bin/fixAudio &
/usr/lib/xfce4/notifyd/xfce4-notifyd &
# runCommand gnome-session
$HOME/.config/polybar/launch.sh &
systemctl --user start xfce4-notifyd &
sleep 3 && sudo systemctl restart ckb-next-daemon &
xset r rate 250 35 &
# runCommand waybar -l trace
# runCommand sway-alttab
# runCommand mako
# runCommand idler
# runCommand delLock
# runCommand xidlehook --not-when-audio --timer primary 240 'locker' 'killall i3lock' --timer normal 5 'xset dpms force off' ''
