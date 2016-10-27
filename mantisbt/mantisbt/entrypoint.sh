#!/bin/bash

/render-templates.sh /var/www/html/config /var/www/html/config
apache2-foreground
