#!/bin/bash

password=$(cat ~/.myconfig/owncloud/password | xargs)
if ! pgrep -x "owncloudcmd" > /dev/null
then
	owncloudcmd -u 1077 -p $password --exclude ~/.myconfig/owncloud/exclude.txt ~/ownCloud/ https://nc3.jaba.hosting/remote.php/webdav
else
	echo 'Owncloudcmd is already running. Doing nothing.'
fi
