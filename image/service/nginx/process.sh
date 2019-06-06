#!/bin/bash -e
echo "Starting nginx..."
exec /usr/sbin/nginx -g "daemon off;"
