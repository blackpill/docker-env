FROM tomcat:7.0
ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD tech-sdkwrapper.war /usr/local/tomcat/webapps/tech-sdkwrapper.war

#set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD sources.list    /etc/apt/sources.list

