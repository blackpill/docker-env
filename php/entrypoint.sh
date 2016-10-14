#!/bin/bash

#set -eu

mkdir -p $WWWROOT
chown -R www-data.www-data $WWWROOT
if [ "$USE_NFS" = "1" ]; then	
    mount -t nfs $NFS_SERVER:$NFS_DIR $WWWROOT
    echo Use NFS
else
    echo Use VFS
fi
cd $WWWROOT
composer require topthink/think-testing
php-fpm
