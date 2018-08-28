#!/bin/bash

brightness 100

# Keyboard layout
setxkbmap us altgr-intl

# These should only have one instance running
if [[ ! $(ps -e|grep tilda) ]]; then
# run after the desktop loads so that transparency works
sleep 5 && tilda &
fi

if [[ ! $(ps -e|grep remind.sh) ]]; then
~/.myconfig/scripts/remind.sh &
fi

if [[ ! $(ps -e|grep tint2) ]]; then
#tint2 -c ~/.myconfig/user_files/tint2rc &
echo pass
fi

if [[ ! $(ps -e|grep offlineimap) ]]; then
offlineimap &
fi

if [[ ! $(ps -e|grep syncthing) ]]; then
syncthing -no-browser &
fi

if [[ ! $(ps -e|grep calendar-sync) ]]; then
yes | ~/.myconfig/scripts/calendar-sync.sh &
fi

if [[ ! $(ps -e|grep tmux) ]]; then
~/.myconfig/scripts/tmux-start &
fi

#xbindkeys & # this is started by desktop. not currently sure of a way to disable that.

# These can be run a second time without creating another instance.
riot-web &
#discord-ptb &
sshfs Sam@corriander:/cygdrive/e/shared/ /home/sam/shared/ -o ro,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 &
