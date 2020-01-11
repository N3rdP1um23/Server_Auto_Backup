#!/bin/bash

###
#
# N3rdP1um23
# January 10, 2020
# v1.0
# This file is used to run in the background to perform the backup of your server.
# 1. If a zero (0) Plex streams are detected & a backup is not currently running, the back will start
# 2. If a Plex stream is detected, the backup background task is killed
#
###

## Get the number of streams for Plex & chack if there is a running backup
STREAM_COUNT=`./CurrentPlexStreams.sh`
BACKUP_STATUS=`ps -ef | grep "rclone --transfer*" | grep -v grep | head -1 | awk '{print $2}'`

## Check if there are no plex streams & no current backup
if [ $STREAM_COUNT -eq 0 ] && [ -z "$BACKUP_STATUS" ]; then
	## Perform the Backup
	rclone --transfers=4 --checkers=35 --drive-chunk-size=256M --drive-upload-cutoff=256M --bwlimit=52M --progress -v  sync <TO> <FROM>
elif [ $STREAM_COUNT -gt 0 ]; then
	## Kill transfer if there is a stream
	kill $BACKUP_STATUS
fi
