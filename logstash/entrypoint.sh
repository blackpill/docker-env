#!/bin/bash

#set -eu

/render-templates.sh /usr/share/logstash/config /usr/share/logstash/config
/render-templates.sh /usr/share/logstash/pipeline /usr/share/logstash/pipeline

/usr/local/bin/docker-entrypoint
