FROM    vimagick/mantisbt:latest

ENV DB_USER root 
ENV DB_PASSWORD 123456
ENV DB_NAME mantisbt

ADD  render-templates.sh /render-templates.sh
ADD  substitute-env-vars.sh /substitute-env-vars.sh
ADD  entrypoint.sh /entrypoint.sh
ADD  config_inc.php.tmpl /var/www/html/config/config_inc.php.tmpl
RUN chmod +x /render-templates.sh
RUN chmod +x /substitute-env-vars.sh
RUN chmod +x /entrypoint.sh
#RUN /render-templates.sh /var/www/html/config /var/www/html/config
EXPOSE 80
ENTRYPOINT /entrypoint.sh



