#!/bin/bash

#set -eu

mkdir -p $WWWROOT
chown -R www-data.www-data $WWWROOT
mount -t nfs $NFS_SERVER:$NFS_DIR $WWWROOT
