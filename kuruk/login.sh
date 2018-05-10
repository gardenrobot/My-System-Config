#!/bin/bash

offlineimap &
~/.myconfig/tmux-start &
yes | ~/.myconfig/calendar-sync.sh &
riot-web &
