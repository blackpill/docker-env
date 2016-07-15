#!/bin/bash

#set -eu

mkdir -p $WWWROOT
chown -R www-data.www-data $WWWROOT
mount -t nfs $NFS_SERVER:$NFS_DIR $WWWROOT
/render-templates.sh /etc/nginx/sites-templates /etc/nginx/conf.d
exec $@
