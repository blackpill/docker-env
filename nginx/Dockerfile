FROM nginx:1.9

ENV  SITE_DOMAIN jr1.local
ENV  WWWROOT /wwwroot
ENV  USE_NFS 0
ENV  NFS_SERVER 10.171.76.236
ENV  NFS_DIR /wwwroot
ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  *.sh /
RUN  chmod +x /*.sh
RUN  mkdir -p /etc/nginx/sites-template
RUN  apt-get update && apt-get install -y \
                                    vim \
                                    nfs-common 
ADD  sites-templates/*    /etc/nginx/sites-templates/
VOLUME ["/wwwroot"]
EXPOSE 80 443
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]
