#!/bin/bash

export BORG_REPO='/mnt/usb1/borgbackups'

borg create $BORG_REPO::syncthing-{now} /home/sam/Syncthing/
borg create $BORG_REPO::syncthing-pass-{now} /home/sam/Syncthing-Password/
borg create $BORG_REPO::camera-{now} /home/sam/.camera/
borg create $BORG_REPO::radicale-{now} /var/lib/radicale/

