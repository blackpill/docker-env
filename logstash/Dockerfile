FROM logstash:6.6.1

USER root
RUN bin/logstash-plugin install logstash-input-jdbc
RUN bin/logstash-plugin install logstash-output-elasticsearch
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD mysql-connector-java-8.0.15.tar.gz /opt


ADD  *.sh /
RUN  chmod +x /*.sh

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
RUN chmod ugo+rw -R /usr/share/logstash/pipeline/
RUN chmod ugo+rw -R /usr/share/logstash/config/
RUN yum update -y && yum install -y perl && \
    yum clean all
USER 1000

ENV DB_HOST 114.215.192.224
ENV DB_NAME zhenmuwang
ENV DB_USERNAME jr1
ENV DB_PASSWORD JRyhdweb123
ENV ES_HOST 192.168.1.108
ENV ES_PORT 9200
ENTRYPOINT ["/entrypoint.sh"]