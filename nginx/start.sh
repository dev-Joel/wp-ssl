#!/bin/bash
#
# startup.sh
#

# Startup the nginx server validate start
nginx -g "daemon on;"

# Shuts down the daemonized nginx server and fires up one in the foreground.
nginx -s stop && nginx -g 'daemon off;'
