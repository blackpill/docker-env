#!/bin/bash

#set -eu

/render-templates.sh /etc/nginx/sites-templates /etc/nginx/conf.d
cd /wwwroot
npm start
#nginx
exec $@
