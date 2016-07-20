FROM blackpill/php

ENV  WWWROOT /wwwroot
ENV  NFS_SERVER 10.171.76.236
ENV  NFS_DIR /wwwroot

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get update && apt-get install -y \
         subversion \
         wget \
         nodejs \
         && rm -r /var/lib/apt/lists/*

RUN npm install -g gulp
# Write Permission

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
VOLUME ["/wwwroot"]
