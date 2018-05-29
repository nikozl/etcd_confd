#!/bin/bash

export PATH="$PATH:/opt/confd/bin"
/etc/init.d/nginx start
while true; do

   if confd -onetime 2>&1 | grep 'out of sync'; then
        sleep 30
        confd -onetime 2>&1
        /etc/init.d/nginx reload
      echo "Config updated and nginx reloaded"
    fi

done
