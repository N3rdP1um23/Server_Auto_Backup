#!/bin/bash

###
#
# N3rdP1um23
# January 10, 2020
# v1.0
# This file is used query Tautulli and check if there is an active Plex Stream
#
###

## Variables
PLEX_TOKEN='<PLEX_TOKEN>'

## Grab the number of current Plex Streams
curl -sL [http|https]://<PLEX_SERVER_IP>:32400/status/sessions?X-Plex-Token=$PLEX_TOKEN | xmllint --xpath 'string(//MediaContainer/@size)' -
