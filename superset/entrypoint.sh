#!/bin/bash

#set -eu

/render-templates.sh /home/superset /home/superset
cd /home/superset
superset runserver
exec $@
