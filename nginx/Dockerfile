FROM nginx:1.9

ENV  SITE_DOMAIN jr1.local
ENV  WWWROOT /wwwroot
ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  *.sh /
RUN  chmod +x /*.sh
RUN  mkdir -p /etc/nginx/sites-template
ADD  sites-templates/*    /etc/nginx/sites-templates/
VOLUME ["/wwwroot"]
EXPOSE 80 443
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]
