#!/usr/bin/env sh

exec 1>/tmp/autostart.log 2>&1

runCommand() {
    pgrep "$(echo "$@" | cut -d ' ' -f 1)" ||
    ("$@" > /tmp/"$1.log" 2>&1) &
}

runCommand mpd
runCommand conky
runCommand nm-applet
runCommand rescuetime
runCommand numlockx
runCommand i3-alttab
runCommand feh --bg-scale ~/.config/awesome/themes/powerarrow-dark/wall.jpg
$HOME/.config/polybar/launch.sh &
sudo systemctl restart ckb-next-daemon &
runCommand ckb-next
# runCommand waybar -l trace
# runCommand sway-alttab
# runCommand mako
# runCommand idler
# runCommand delLock
# runCommand xidlehook --not-when-audio --timer primary 240 'locker' 'killall i3lock' --timer normal 5 'xset dpms force off' ''
