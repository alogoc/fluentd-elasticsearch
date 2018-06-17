#!/bin/sh

mkdir -p /var/log/journal

#!/bin/bash

# Start Fluentd-ui process
/usr/local/bin/fluentd-ui start --daemonize
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start fluentd-ui: $status"
  exit $status
fi

# Start Fluentd process
/usr/local/bin/fluentd -d /var/run/lock/fluentd.pid --no-supervisor -q  
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start fluentd: $status"
  exit $status
fi
