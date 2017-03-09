FROM redis:3.0

RUN mkdir -p /usr/local/etc/redis-templates
ADD *.tmpl /usr/local/etc/redis-templates/
ADD entrypoint.sh /entrypoint.sh
ADD render-templates.sh /render-templates.sh
ADD substitute-env-vars.sh /substitute-env-vars.sh

RUN chmod +x /*.sh

EXPOSE 6379

ENTRYPOINT ["/entrypoint.sh"]