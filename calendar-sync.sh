#!/bin/bash

if [[ ! $(ps -e|grep calendar-sync) ]]; then

	vdirsyncer discover calendar_personal
	vdirsyncer discover contacts_personal

	sleep=1200

	while [ 1 ]
	do
		echo 'Syncing'
		vdirsyncer sync
		echo "Done. Sleeping for $sleep seconds."
		sleep $sleep
	done

fi
