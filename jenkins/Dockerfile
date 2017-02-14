FROM voduytuan/jenkins-php-docker

USER root
RUN apt-get update && apt-get install -y \
         libxslt-dev \
         && rm -r /var/lib/apt/lists/*

# PHPdox
ADD xsl.so /usr/lib/php5/20131226/xsl.so
ADD ext-xsl.ini /etc/php5/cli/conf.d/ext-xsl.ini
ADD phpdox-0.9.0.phar /usr/bin/phpdox
ADD docker /usr/bin/docker
RUN chmod +x /usr/bin/docker
RUN chmod 755 /usr/bin/phpdox

EXPOSE 8080
USER jenkins
