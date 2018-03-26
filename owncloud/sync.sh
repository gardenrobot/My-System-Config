#!/bin/bash

password=$(echo ~/.myconfig/owncloud/password)
owncloudcmd -u 1077 -p $password --exclude ~/.myconfig/exclude.txt ~/ownCloud/ https://nc3.jaba.hosting/remote.php/webdav
