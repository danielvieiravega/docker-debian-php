FROM php:7.1-apache-stretch

LABEL maintainer="Ammar K."

RUN set -x \
    && build_deps=" \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libxslt-dev \
        libzip-dev \
    " \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        $build_deps \
        libfreetype6 \
        libjpeg62-turbo \
        libmcrypt4 \
        libpng16-16 \
        libxslt1.1 \
        libzip4 \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
    && NPROC=$(getconf _NPROCESSORS_ONLN) \
    && docker-php-ext-install -j${NPROC} \
        bcmath \
        gd \
        gettext \
        intl \
        mcrypt \
        mysqli \
        pdo_mysql \
        soap \
        xsl \
        zip \
    && apt-get purge -y \
        --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
        $build_deps
