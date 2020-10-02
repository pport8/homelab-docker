#! /usr/bin/env bash

state=$( docker inspect -f '{{.State.Running}}' nextcloud )

if [ "$state" = "true" ]; then
    docker exec -u www-data nextcloud php -f cron.php
fi

