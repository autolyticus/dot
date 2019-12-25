#!/usr/bin/env sh

exec 1>/tmp/autostart.log 2>&1

runCommand() {
    pkill "$(echo "$@" | cut -d ' ' -f 1)"
    ("$@" > /tmp/"$1.log" 2>&1) &
}

runCommand mpd
# runCommand nm-applet --indicator
runCommand waybar
runCommand sway-alttab
runCommand mako
runCommand idler
# runCommand rescuetime
# runCommand delLock
# runCommand xidlehook --not-when-audio --timer primary 240 'locker' 'killall i3lock' --timer normal 5 'xset dpms force off' ''
