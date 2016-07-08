#!/bin/bash

#set -eu

mkdir -p $WWWROOT
chown -R www-data.www-data $WWWROOT
/render-templates.sh /etc/nginx/sites-templates /etc/nginx/conf.d
exec $@
