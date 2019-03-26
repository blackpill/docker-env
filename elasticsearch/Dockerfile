FROM elasticsearch:6.6.2
COPY elasticsearch-analysis-ik-6.6.2.zip /tmp/elasticsearch-analysis-ik-6.6.2.zip
COPY elasticsearch-analysis-pinyin-6.6.2.zip /tmp/elasticsearch-analysis-pinyin-6.6.2.zip
RUN ./bin/elasticsearch-plugin install -b file:///tmp/elasticsearch-analysis-ik-6.6.2.zip
RUN ./bin/elasticsearch-plugin install -b file:///tmp/elasticsearch-analysis-pinyin-6.6.2.zip
#RUN ./bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.6.2/elasticsearch-analysis-ik-6.6.2.zip
#RUN ./bin/elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.6.2/elasticsearch-analysis-pinyin-6.6.2.zip
COPY config/ /usr/share/elasticsearch/config/
RUN chown elasticsearch:elasticsearch -R /usr/share/elasticsearch/config
RUN sysctl -w vm.max_map_count=262144

