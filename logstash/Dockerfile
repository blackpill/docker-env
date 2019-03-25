FROM logstash:6.6.1
RUN bin/logstash-plugin install logstash-input-jdbc
RUN bin/logstash-plugin install logstash-output-elasticsearch
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD mysql-connector-java-8.0.15.tar.gz /opt
ADD pipeline/ /usr/share/logstash/pipeline/
ADD config/ /usr/share/logstash/config/
