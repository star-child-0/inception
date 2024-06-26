FROM alpine:3.19

ARG PHP_VERSION DB_NAME DB_USER DB_PASS

RUN apk update && apk upgrade && apk add --no-cache \
	php${PHP_VERSION} \
	php${PHP_VERSION}-fpm \
	php${PHP_VERSION}-mysqli \
	php${PHP_VERSION}-json \
	php${PHP_VERSION}-curl \
	php${PHP_VERSION}-dom \
	php${PHP_VERSION}-exif \
	php${PHP_VERSION}-fileinfo \
	php${PHP_VERSION}-mbstring \
	php${PHP_VERSION}-openssl \
	php${PHP_VERSION}-xml \
	php${PHP_VERSION}-zip \
	wget \
	unzip && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
		/etc/php81/php-fpm.d/www.conf && \
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
		/etc/php81/php-fpm.d/www.conf && \
	sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
		/etc/php81/php-fpm.d/www.conf && \
	rm -f /var/cache/apk/*

WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip &> /dev/null && \
	unzip latest.zip &> /dev/null && \
	cp -rf wordpress/* . && \
	rm -rf wordpress latest.zip

COPY ./requirements/wordpress/conf/create_wp-config.sh .
RUN sh create_wp-config.sh && rm create_wp-config.sh && \
	chmod -R 0777 wp-content/

CMD ["/usr/sbin/php-fpm81", "-F"]
