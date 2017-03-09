#!/bin/bash

#set -eu

set -e
/render-templates.sh /usr/local/etc/redis-templates /usr/local/etc/redis
redis-server /usr/local/etc/redis/redis.conf

exec "$@"
