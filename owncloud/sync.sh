#!/bin/bash

log=~/.owncloud-log

echo Last run $(date) > $log
password=$(cat ~/.myconfig/owncloud/password | xargs)
if ! pgrep -x "owncloudcmd" > /dev/null
then
	echo Running owncloudcmd. >> $log
	owncloudcmd -u 1077 -p $password --exclude ~/.myconfig/owncloud/exclude.txt ~/ownCloud/ 'https://nc3.jaba.hosting/remote.php/webdav'
else
	echo 'owncloudcmd is already running. Doing nothing.' >> $log
fi
