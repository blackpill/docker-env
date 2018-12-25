#!/bin/bash

#set -eu

chmod ugo+rw /var/run/docker.sock

exec $@

