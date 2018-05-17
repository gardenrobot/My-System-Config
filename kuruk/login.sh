#!/bin/bash

# These can be run a second time without creating another instance.
if [[ ! $(ps -e|grep offlineimap) ]]; then
offlineimap &
fi

# These can be run a second time without creating another instance.
riot-web &

# Other scipts
~/.myconfig/tmux-start &
yes | ~/.myconfig/calendar-sync.sh &
