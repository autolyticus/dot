#!/usr/bin/env sh
runCommand() {
    pname="$(echo "$@" | cut -d ' ' -f 1)"
    pkill "$pname"
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
