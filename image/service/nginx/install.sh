#!/bin/bash -e
# this script is run during the image build
cp -f /container/service/nginx/assets/default /etc/nginx/sites-available/default
