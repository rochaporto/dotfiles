#!/bin/bash

i3-msg 'workspace 1; append_layout ~/.i3/workspace-1.json'

terminator -r t1 &
terminator -r t2 &
terminator -r t3 &
google-chrome --new-window mmm.cern.ch/owa its.cern.ch/jira/browse/OS &

sleep 1

i3-msg 'workspace 2; append_layout ~/.i3/workspace-2.json'

terminator -r clock -x tty-clock -c -C 3 -r &
terminator -r mutt -x mutt &
google-chrome --new-window mattermost.web.cern.ch &
