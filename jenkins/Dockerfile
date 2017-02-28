FROM voduytuan/jenkins-php-docker
ADD sources.list    /etc/apt/sources.list
USER root
RUN apt-get update && apt-get install -y \
         libxslt-dev \
		 sudo \
         && rm -r /var/lib/apt/lists/*

# PHPdox
ADD xsl.so /usr/lib/php5/20131226/xsl.so
ADD ext-xsl.ini /etc/php5/cli/conf.d/ext-xsl.ini
ADD phpdox-0.9.0.phar /usr/bin/phpdox
ADD docker /usr/bin/docker
ADD libcgmanager.so.0 /usr/lib/x86_64-linux-gnu/libcgmanager.so.0
ADD libcgmanager.so.0.0.0 /usr/lib/x86_64-linux-gnu/libcgmanager.so.0.0.0
ADD libgcrypt.so.11 /usr/lib/x86_64-linux-gnu/libgcrypt.so.11
ADD libgcrypt.so.11.8.2 /usr/lib/x86_64-linux-gnu/libgcrypt.so.11.8.2
ADD libsystemd-daemon.so.0 /usr/lib/x86_64-linux-gnu/libsystemd-daemon.so.0
ADD libsystemd-daemon.so.0.0.10 /usr/lib/x86_64-linux-gnu/libsystemd-daemon.so.0.0.10
ADD libsystemd-journal.so.0 /usr/lib/x86_64-linux-gnu/libsystemd-journal.so.0
ADD libsystemd-journal.so.0.10.2 /usr/lib/x86_64-linux-gnu/libsystemd-journal.so.0.10.2
ADD libsystemd-login.so.0 /usr/lib/x86_64-linux-gnu/libsystemd-login.so.0
ADD libsystemd-login.so.0.7.1 /usr/lib/x86_64-linux-gnu/libsystemd-login.so.0.7.1
RUN chmod +x /usr/bin/docker
RUN chmod 755 /usr/bin/phpdox

EXPOSE 8080
USER jenkins
ADD entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
USER jenkins
CMD ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]