FROM jenkins/jenkins
ADD sources.list    /etc/apt/sources.list
USER root
ADD docker /usr/bin/docker
RUN apt-get update && apt-get install -y \
         docker \
         sudo \
         && rm -r /var/lib/apt/lists/*

ADD libapparmor.so.1.1.0 /usr/lib/x86_64-linux-gnu/libapparmor.so.1
ADD libcgmanager.so.0.0.0 /usr/lib/x86_64-linux-gnu/libcgmanager.so.0
ADD libdevmapper.so.1.02.1 /usr/lib/x86_64-linux-gnu/libdevmapper.so.1.02.1
ADD libgcrypt.so.11 /usr/lib/x86_64-linux-gnu/libgcrypt.so.11
ADD libltdl.so.7.3.0 /usr/lib/x86_64-linux-gnu/libltdl.so.7
ADD libnih.so.1.0.0 /usr/lib/x86_64-linux-gnu/libnih.so.1
ADD libnih-dbus.so.1 /usr/lib/x86_64-linux-gnu/libnih-dbus.so.1
ADD libsystemd-journal.so.0.10.2 /usr/lib/x86_64-linux-gnu/libsystemd-journal.so.0

RUN chmod +x /usr/bin/docker

EXPOSE 8080
USER jenkins
ADD entrypoint.sh /entrypoint.sh
USER root
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
USER jenkins
CMD ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]