FROM amancevice/superset
ADD sources.list    /etc/apt/sources.list
USER root
RUN apt-get update && apt-get install -y \
         vim \
		 sudo 
COPY node-v6.11.4-linux-x64.tar.xz /opt/node-v6.11.4-linux-x64.tar.xz
RUN xz -d /opt/node-v6.11.4-linux-x64.tar.xz
RUN cd /opt && tar xvf /opt/node-v6.11.4-linux-x64.tar
ENV PATH /bin:/usr/bin:/usr/local/bin:/opt/node-v6.11.4-linux-x64/bin
RUN /opt/node-v6.11.4-linux-x64/bin/npm install -g yarn
RUN cd /usr/local/lib/python3.5/dist-packages/superset/static/assets \
	&& /opt/node-v6.11.4-linux-x64/bin/yarn 
ENV SQLALCHEMY_DATABASE_URI 'sqlite:////ssdata/superset.db'
ADD  superset_config.py.tmpl /home/superset/superset_config.py.tmpl
ADD  *.sh /
RUN  chmod +x /*.sh

VOLUME ["/ssdata"]
EXPOSE 8088
#set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

USER superset
ENTRYPOINT ["/entrypoint.sh"]
CMD ["superset", "runserver"]