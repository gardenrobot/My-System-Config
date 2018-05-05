#!/bin/bash

setxkbmap us altgr-intl
tilda &
#xbindkeys &
discord-ptb &
#redshift-gtk &
python ~/.reddit-search-notifications/reddit-search-notifications.py &
tint2 -c ~/.myconfig/tint2rc &
syncthing -no-browser &
sshfs kuruk:/home/sam/Shared/ /home/sam/Shared/ -o ro,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 &
~/.myconfig/tmux-start
