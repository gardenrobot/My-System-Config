#!/bin/bash

# These can be run a second time without creating another instance.
if [[ ! $(ps -e|grep tilda) ]]; then
# run after the desktop loads so that transparency works
sleep 5 && tilda &
fi

if [[ ! $(ps -e|grep offlineimap) ]]; then
offlineimap &
fi

if [[ ! $(ps -e|grep calendar-sync) ]]; then
yes | ~/.myconfig/calendar-sync.sh &
fi

if [[ ! $(ps -e|grep syncthing) ]]; then
syncthing -no-browser &
fi

if [[ ! $(pgrep -u sam tmux) ]]; then
~/.myconfig/tmux-start &
fi

# These can be run a second time without creating another instance.
riot-web &
discord-ptb &
