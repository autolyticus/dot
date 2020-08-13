#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
if type "xrandr"; then
    PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
    OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

    # Launch on primary monitor with tray enabled
    MONITOR=$PRIMARY TRAY_POS=left polybar --reload main &

    # Launch Polybar, on other monitors without tray
    for m in "$OTHERS"; do
        MONITOR=$m polybar --reload main &
    done
else
    polybar --reload main &
fi

echo "Polybar launched..."
