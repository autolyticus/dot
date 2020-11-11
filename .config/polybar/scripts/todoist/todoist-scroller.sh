#!/usr/bin/env sh
zscroll -n=true -l 25 -d 0.1 -u true "$XDG_CONFIG_HOME/polybar/scripts/todoist/todoist.py" -U 300 &
wait
