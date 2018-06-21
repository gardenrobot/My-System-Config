#!/bin/bash
#
# This script acts as a replacement for a caldav client's reminder system. Combined with
# rem2ics and vdirsyncer scripts, it displays desktop notifcations for all events since
# it was last run. However, it does not display the events at the correct time of day.
# Rather all events are shown for the day at once.

interval=60

last_date_run_fn=~/.remind-last-date
if [ ! -f $last_date_run_fn ]
then
	date +%F > $last_date_run_fn
fi

while [ 1 ]
do
	# if it is 0:00-7:00, do nothing
	if [ $(date +%H%M) -lt 700 ];
	then
		echo 'Too early'
		continue
	fi

	# interate from the last date this was run until today, runnign 'remind' on each day
	last_date_run=$(cat $last_date_run_fn)
	start=$(date -d $last_date_run +%s)
	end=$(date +%s);
	while [[ "$start" -le "$end" ]];
	do
		current_date=$(date -d "@$start" +%F)

		remind '-knotify-send -u critical %s' ~/.reminders $current_date

		let start+=86400
	done
	current_date=$(date -d "@$start" +%F)
	echo $current_date > $last_date_run_fn
	echo 'Done. Sleeping.'
	sleep $interval
done
