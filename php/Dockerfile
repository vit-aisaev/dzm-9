FROM php:8.1-fpm

RUN set -eux; \
	curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s \
        apcu \
        intl \
        opcache \
        zip \
        gd \
        mysqli \
        @composer \
    ;

COPY php.ini $PHP_INI_DIR/conf.d/