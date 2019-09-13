#!/bin/bash

i3-msg 'workspace 1; append_layout ~/.i3/workspace-1.json'

terminator -r t1 &
terminator -r t2 &
terminator -r t3 &
google-chrome --new-window mmm.cern.ch/owa its.cern.ch/jira/browse/OS &

sleep 2

i3-msg 'workspace 2; append_layout ~/.i3/workspace-2.json'

terminator -r clock -x tty-clock -c -C 3 -r &
terminator -r metar -x 'while true; do setterm -cursor off; clear; echo -e "\e[33m$(curl -s https://tgftp.nws.noaa.gov/data/observations/metar/stations/LSGG.TXT)"; echo -e "\n\e[94m$(curl -s https://tgftp.nws.noaa.gov/data/forecasts/taf/stations/LSGG.TXT)"; sleep 600; done'
terminator -r mutt -x mutt &
google-chrome --new-window mattermost.web.cern.ch &
