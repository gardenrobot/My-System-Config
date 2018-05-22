#!/bin/bash

vdirsyncer discover calendar_personal
vdirsyncer discover calendar_personal_single
vdirsyncer discover contacts_personal

sleep=1200

while [ 1 ]
do
	echo 'Syncing'
	vdirsyncer sync
	echo 'Running ics2rem'
	ics2rem ~/.reminder-cal/personal.ics ~/.reminders
	echo "Done. Sleeping for $sleep seconds."
	sleep $sleep
done
