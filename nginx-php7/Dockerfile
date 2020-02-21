FROM php:7.3-fpm-stretch
#nginx
ENV NGINX_VERSION 1.16.1-1~stretch

#set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD sources.list    /etc/apt/sources.list
ADD buster.list /etc/apt/sources.list.d/buster.list
RUN apt-get update \
	&& apt-get -f install --no-install-recommends --no-install-suggests -y \
						git \
						vim \
					    nfs-common \
						curl \
						wget \
						gnupg2 \
						ca-certificates \
						lsb-release
RUN echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    |tee /etc/apt/sources.list.d/nginx.list

RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
							
RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-perl \
						nginx-module-njs
RUN apt-get install --no-install-recommends --no-install-suggests -y \						
	                    libgearman-dev \
						libmemcached-dev \
						libmcrypt-dev \
						libfreetype6-dev \
						libjpeg62-turbo-dev \
						libpng-dev \
                        zlib1g-dev \
                        libsasl2-dev \
						libicu-dev libc-client-dev libkrb5-dev libxml2-dev libldap-dev libltdl-dev libzip-dev \
	&& rm -rf /var/lib/apt/lists/*

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443



# Install env
ENV  WWWROOT /wwwroot
ENV  USE_NFS 0
ENV  NFS_SERVER 10.171.76.236
ENV  NFS_DIR /wwwroot


# Install PHP extensions
#COPY memcached.tgz /home/memcached.tgz
#COPY gearman.tgz /home/gearman.tgz
#COPY redis.tgz /home/redis.tgz
#COPY msgpack.tgz /home/msgpack.tgz
#COPY xdebug.tgz /home/xdebug.tgz
#COPY memcache.tgz /home/memcache.tgz
#COPY xhprof.tgz /home/xhprof.tgz
#COPY cphalcon.tgz /home/cphalcon.tgz

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/freetype2 --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd 
RUN docker-php-ext-install bcmath 
RUN docker-php-ext-install zip
RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install mysqlnd
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install intl
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap
RUN docker-php-ext-install soap
RUN docker-php-ext-install exif
RUN docker-php-ext-install ldap

RUN pecl install apcu
RUN echo "extension = apcu.so" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-apcu.ini

#RUN wget http://www.imagemagick.org/download/ImageMagick-7.0.8-60.tar.gz
ADD ImageMagick-7.0.9-24.tar.gz /tmp
#RUN tar zxvf ImageMagick.tar.gz
RUN cd /tmp/ImageMagick-7.0.9-24 \
    && ./configure --prefix=/usr/local/ImageMagick/ --enable-lzw --with-modules --with-quantum-depth=8 --enable-shared --disable-openmp \
    && make && make install 

RUN wget http://pecl.php.net/get/imagick-3.4.4.tgz
RUN tar zxvf imagick-3.4.4.tgz
RUN cd imagick-3.4.4 \
    && phpize \
    && ./configure --with-imagick=/usr/local/ImageMagick/ \
    && make && make install
RUN echo "extension = imagick.so" | tee -a /usr/local/etc/php/conf.d/docker-php-ext-imagick.ini
#        && docker-php-ext-install mcrypt \
#        && docker-php-ext-install mysql \
# RUN pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini 
#         && pecl install /home/xdebug.tgz && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini
# RUN pecl install /home/memcached.tgz && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini \
#         && pecl install /home/gearman.tgz && echo "extension=gearman.so" > /usr/local/etc/php/conf.d/gearman.ini \
#         && pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
#         && pecl install /home/msgpack.tgz && echo "extension=msgpack.so" > /usr/local/etc/php/conf.d/msgpack.ini \
#         && pecl install /home/memcache.tgz && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/memcache.ini \
#         && pecl install /home/xhprof.tgz && echo "extension=xhprof.so" > /usr/local/etc/php/conf.d/xhprof.ini \

# RUN cd /home \
#     && tar -xvf cphalcon.tgz \
#     && mv cphalcon-* phalcon \
#     && cd phalcon/build && ./install && echo "extension=phalcon.so" > /usr/local/etc/php/conf.d/phalcon.ini

# PHP config
ADD php.ini    /usr/local/etc/php/php.ini
ADD php-fpm.conf    /usr/local/etc/php-fpm.conf

# Composer
ADD composer.phar /usr/local/bin/composer
RUN chmod 755 /usr/local/bin/composer

# PHP CodeSniffer
ADD dos2unix    /usr/bin/dos2unix
RUN chmod 755 /usr/bin/dos2unix
RUN pear install PHP_CodeSniffer
RUN phpcs --config-set default_standard Zend
WORKDIR /opt

# Write Permission
RUN usermod -u 33 www-data

EXPOSE 9000
ENV  SITE_DOMAIN jr1.local
ADD  nginx.conf      /etc/nginx/nginx.conf
ADD  *.sh /
RUN  chmod +x /*.sh
RUN  mkdir -p /etc/nginx/sites-template

ADD  sites-templates/*    /etc/nginx/sites-templates/

VOLUME ["/localroot"]
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
#ONBUILD ADD app.tar /wwwroot
CMD ["nginx"]
