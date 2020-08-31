#!/bin/bash
while true; do
	DEVICE=`ls /dev/snd/hwC[[:print:]]*D0 | head -n 1`
	if [ ! -z "$DEVICE" ]; then
		hda-verb "$DEVICE" 0x20 SET_COEF_INDEX 0x67
		hda-verb "$DEVICE" 0x20 SET_PROC_COEF 0x3000
		break
	fi
	sleep 1
done
