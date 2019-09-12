#!/bin/bash

i3-msg 'workspace 1; append_layout ~/.i3/workspace-1.json'

terminator -r t1 &
terminator -r t2 &
terminator -r t3 &
google-chrome --new-window mmm.cern.ch/owa its.cern.ch/jira/browse/OS &

i3-msg 'workspace 2; append_layout ~/.i3/workspace-2.json'

sleep 10

terminator -r metar -x bash -c 'while true; do setterm -cursor off; clear; echo -e \"\e[33m$(curl -s https://tgftp.nws.noaa.gov/data/observations/metar/stations/LSGG.TXT)\"; sleep 600; done'
terminator -r clock -x tty-clock -c -C 3 -r &
terminator -r mutt -x mutt &
google-chrome --new-window mattermost.web.cern.ch &
