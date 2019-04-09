#!/usr/bin/env sh

exec 1>/tmp/autostart.log 2>&1

runCommand() {
    pkill "$(echo "$@" | cut -d ' ' -f 1)"
    ("$@" > /tmp/"$1.log" 2>&1) &
}

runCommand conky
runCommand feh --bg-scale ~/.config/awesome/themes/multicolor/vio.jpg
runCommand mpd
runCommand nm-applet
runCommand numlockx
runCommand redshift -l 20.5937:78.9629 -t 6500:3000
runCommand rescuetime
runCommand unclutter -root
runCommand delLock
xidlehook --not-when-fullscreen --not-when-audio --timer primary 60 'locker' '' --timer normal 240 'xset dpms force off' '' &
