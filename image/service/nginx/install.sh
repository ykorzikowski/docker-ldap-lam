#!/bin/bash -e
# this script is run during the image build
cp -r assets/default /etc/nginx/sites-available/default
