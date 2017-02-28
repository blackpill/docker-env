#!/bin/bash

#set -eu

chmod ugo+rw /var/run/docker.sock
su - jenkins
/bin/tini -- /usr/local/bin/jenkins.sh
exec $@

