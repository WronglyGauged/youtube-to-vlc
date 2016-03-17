#!/bin/bash

# (C) 2016 Robin Raymond

input="$1"
player="vlc"

if [ -z "$input" ]; then
    echo "Usage: youtube-to-vlc.sh [URL TO YOUTUBE]"
    echo ""
    echo "All this program does is remove the '&t=...' part of the"
    echo "url, turns it into an offset in seconds and calls vlc"
    echo "with it."
    echo ""
    echo "(C) 2016 Robin Raymond"
    exit 0
fi

youtube=`expr match $input '\([^&]*\)'`
time=`expr match $input '.*&t=\(.*\)'`

if [ -z "$time" ] || [ -z "$youtube" ]; then
    echo "Couldn't match $input"
    exit 1
fi

minutes=`expr match "$time" '\([0-9]*\)m'`
seconds=`expr match "$time" '[0-9]*m\([0-9]*\)s'`
offset=$(($minutes * 60 + $seconds))

exec $player $youtube "--start-time=$offset"
