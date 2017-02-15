FROM nginx:1.9
RUN  apt-get update && apt-get install -y \
                                    vim \
                                    nfs-common \
									subversion
ENV  SITE_DOMAIN jr1.local
MKDIR /wwwroot
ENV  WWWROOT /wwwroot
ENV  USE_NFS 0
ENV  NFS_SERVER 10.171.76.236
ENV  NFS_DIR /wwwroot
ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  *.sh /
RUN  chmod +x /*.sh
RUN  mkdir -p /etc/nginx/sites-template

ADD  sites-templates/*    /etc/nginx/sites-templates/
ONBUILD ADD app.tar /wwwroot
EXPOSE 80 443
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx"]
