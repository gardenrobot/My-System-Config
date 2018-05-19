#!/bin/bash

# These can be run a second time without creating another instance.
if [[ ! $(ps -e|grep offlineimap) ]]; then
offlineimap &
fi

if [[ ! $(ps -e|grep calendar-sync) ]]; then
yes | ~/.myconfig/calendar-sync.sh &
fi

if [[ ! $(ps -e|grep tmux) ]]; then
~/.myconfig/tmux-start &
fi

# These can be run a second time without creating another instance.
riot-web &
