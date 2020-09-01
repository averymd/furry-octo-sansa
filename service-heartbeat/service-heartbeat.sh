#!/bin/bash

# Originally from https://maslosoft.com/kb/watching-for-service-with-cron/
# Updated to use Uptime Robot's heartbeat service

service=$1
heartbeat_id=$2

/bin/systemctl -q is-active "$service.service"
status=$?
if [ "$status" == 0 ]; then
    wget --spider "https://heartbeat.uptimerobot.com/$heartbeat_id"
else
    /bin/systemctl start "$service.service"
fi
