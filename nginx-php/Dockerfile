FROM php:5.6-fpm
#nginx
ENV NGINX_VERSION 1.14.2-1~stretch

#set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD sources.list    /etc/apt/sources.list
RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						gettext-base \
						git \
						vim \
						nfs-common \
						dirmngr \
						gnupg2

ADD nginx_signing.key /nginx_signing.key
RUN apt-key add /nginx_signing.key
RUN echo "deb http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list \
    && apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						ca-certificates \
						nginx=${NGINX_VERSION} \
						nginx-module-xslt \
						nginx-module-geoip \
						nginx-module-image-filter \
						nginx-module-njs \
						libfreetype6-dev \
						zlib1g-dev \
						libsasl2-dev \
                        libgearman-dev \
						libmemcached-dev \
						libmcrypt-dev \						
						libjpeg62-turbo-dev \
						libpng-dev \						
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
COPY redis.tgz /home/redis.tgz
#COPY msgpack.tgz /home/msgpack.tgz
#COPY xdebug.tgz /home/xdebug.tgz
#COPY memcache.tgz /home/memcache.tgz
#COPY xhprof.tgz /home/xhprof.tgz
#COPY cphalcon.tgz /home/cphalcon.tgz

RUN docker-php-ext-configure gd --enable-gd-native-ttf --with-freetype-dir=/usr/include/freetype2 --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install gd \
		&& docker-php-ext-install bcmath \
        && docker-php-ext-install zip \
        && docker-php-ext-install mbstring \
        && docker-php-ext-install mcrypt \
        && docker-php-ext-install mysql \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install pdo_mysql
RUN pecl install /home/redis.tgz && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
         && pecl install /home/xdebug.tgz && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini
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
# ONBUILD ADD app.tar /wwwroot
CMD ["nginx"]