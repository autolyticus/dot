#!/usr/bin/env bash

# Please enter all times in UTC Seconds since Epoch
# Syntax: humanTS then [now]

if [ "$#" -eq 2 ]; then
	secondDiffThen="$1"
	secondDiffNow="$2"
elif [ "$#" -eq 1 ]; then
	secondDiffNow="$(date +%s)"
	secondDiffThen="$1"
else
	echo "Invalid syntax. Correct syntax is:"
	echo "$0 secondDiffThen [secondDiffNow]"
	exit 64
fi

SECONDSINMINUTE=60
SECONDSINHOUR=$((SECONDSINMINUTE * 60))
SECONDSINDAY=$((SECONDSINHOUR * 24))
SECONDSINMONTH=$((SECONDSINDAY * 30))
SECONDSINYEAR=$((SECONDSINDAY * 365))

secondDiff=$((secondDiffNow - secondDiffThen))
if [ $secondDiff -lt 0 ]; then
	secondDiff=$((-secondDiff))
	future='y'
fi
# echo $secondDiff

seconds=$secondDiff

years=$((secondDiff / SECONDSINYEAR))
seconds=$((seconds % SECONDSINYEAR))
if [ $years -gt 1 ]; then
	echo -n  "$years years "
fi

months=$((seconds / SECONDSINMONTH))
seconds=$((seconds % SECONDSINMONTH))
if [ $months -gt 1 ]; then
	echo -n  "$months months "
fi

days=$((seconds / SECONDSINDAY))
seconds=$((seconds % SECONDSINDAY))
if [ $days -gt 1 ]; then
	echo -n  "$days days "
fi

hours=$((seconds / SECONDSINHOUR))
seconds=$((seconds % SECONDSINHOUR))
if [ $hours -gt 1 ]; then
	echo -n  "$hours hours "
fi

minutes=$((seconds / SECONDSINMINUTE))
seconds=$((seconds % SECONDSINMINUTE))
if [ $minutes -gt 1 ]; then
	echo -n  "$minutes minutes "
fi

echo -n "$seconds seconds "

if [ -n "$future" ]; then
	echo "in the future"
else
	echo "ago"
fi
