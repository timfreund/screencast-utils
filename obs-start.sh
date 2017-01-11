#!/bin/bash

function obs-position {
    obs_id=`wmctrl -l | grep 'OBS' | awk '{print $1}'`
    wmctrl -i -r "${obs_id}" -e 0,1921,2360,1520,1300
}

function obs-jackconnect {
    jack_connect 'system:capture_1' 'OBS Jack Input:in_1' >/dev/null
    jack_connect 'system:capture_1' 'OBS Jack Input:in_2' >/dev/null
}

function obs-start {
    obs 2>&1 > /dev/null &
    sleep 1
    obs-position
    obs-jackconnect
}

obs-start
