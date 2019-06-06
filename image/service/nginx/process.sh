#!/bin/bash -e
log-helper level eq trace && set -x

echo "Starting nginx..."
exec /usr/sbin/nginx -g "daemon off;"
