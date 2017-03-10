FROM nginx:1.9


ADD sources.list    /etc/apt/sources.list
ADD entrypoint.sh /entrypoint.sh
ADD render-templates.sh /render-templates.sh
ADD substitute-env-vars.sh /substitute-env-vars.sh
ADD  sites-enabled/*tmpl    /etc/nginx/sites-templates/
ADD  nginx.conf    /etc/nginx/nginx.conf

RUN  chmod +x /*.sh
RUN  mkdir -p /etc/nginx/sites-templates
RUN  rm -f /etc/nginx/conf.d/default.conf

RUN apt-get update \
    && apt-get install -y -qq node \
    npm \
    nodejs-legacy \
    && rm -rf /var/lib/apt/lists/*
RUN npm config set registry https://registry.npm.taobao.org
RUN mkdir -p /wwwroot
RUN cd /wwwroot \
    && npm install

ENV  WWWROOT /wwwroot
ENV  USE_NFS 0
ENV  NFS_SERVER 10.171.76.236
ENV  NFS_DIR /wwwroot
	
VOLUME ["/localroot"]
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

ONBUILD ADD app.tar /wwwroot
CMD ["nginx"]
