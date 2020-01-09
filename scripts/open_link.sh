#!/bin/bash
# Sometimes you need to open and view an image url from your terminal but
# you dont want to wait for your little babby netbook to load your browser.
# Use this to wget the image instead. Non-image urls will open browser.

function open_in_browser {
	if [ "$(which sw_vers)" ]; then
		open $1
	else
		firefox $1
	fi
}

function open_in_local_viewer {
	mkdir -p /tmp/open_link.sh/
	tmp_fn="/tmp/open_link.sh/$(date +%s)"
	wget --output-document=${tmp_fn} "$1"
	if [ "$(which sw_vers)" ]; then
		open -a 'Preview' "$tmp_fn"
	else
		ristretto "$tmp_fn" # TODO use preferred image application
	fi
}

if [[ $1 =~ \.png$ ]] || [[ $1 =~ \.jpg$ ]] || [[ $1 =~ \.jpeg$ ]] or [[ $1 =~ \.jpeg$ ]];
then
	open_in_local_viewer $1
else
	open_in_browser $1
fi
