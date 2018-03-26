#!/bin/bash

password=$(echo ~/.myconfig/owncloud/password)
if ! pgrep -x "owncloudcmd" > /dev/null
then
	owncloudcmd -u 1077 -p $password --exclude ~/.myconfig/exclude.txt ~/ownCloud/ https://nc3.jaba.hosting/remote.php/webdav
else
	echo 'Owncloudcmd is already running. Doing nothing.'
fi
