#!/bin/sh

set -e

readonly VERSION="2.7.0beta1"


touch /var/log/xdebug.log

pecl install xdebug-${VERSION}
docker-php-ext-enable xdebug
