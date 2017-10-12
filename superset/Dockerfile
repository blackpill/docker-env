FROM amancevice/superset
ADD sources.list    /etc/apt/sources.list
USER root
RUN apt-get update && apt-get install -y \
         vim \
		 sudo 
COPY node-v6.11.4-linux-x64.tar.xz /opt/node-v6.11.4-linux-x64.tar.xz
RUN xz -d /opt/node-v6.11.4-linux-x64.tar.xz
RUN tar xvf /opt/node-v6.11.4-linux-x64.tar
RUN export PATH=$PATH:/opt/node-v6.11.4-linux-x64/bin \
    && npm install -g yarn \
	&& cd /usr/local/lib/python3.5/dist-packages/superset/static/assets \
	&& yarn 
ADD  superset_config.py /home/superset/superset_config.py
VOLUME ["/ssdata"]
EXPOSE 8088
