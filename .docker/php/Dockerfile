FROM composer

RUN apk update && \
    apk upgrade && \
    apk add autoconf g++ linux-headers && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    docker-php-ext-install pdo_mysql
