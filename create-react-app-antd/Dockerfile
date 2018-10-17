FROM node:10-stretch
#set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD sources.list    /etc/apt/sources.list
RUN npm config set registry https://registry.npm.taobao.org && npm install -g create-react-app
RUN mkdir /project
WORKDIR /project
RUN create-react-app antd-demo
RUN cd /project/antd-demo \
    && yarn add antd
ADD startup.sh /startup.sh
RUN chmod +x /startup.sh
RUN apt-get update \
	&& apt-get -f install --no-install-recommends --no-install-suggests -y \
						subversion \
						vim 
ENTRYPOINT ["/startup.sh"]
