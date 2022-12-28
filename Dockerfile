ARG PHP_VERSION=5.3.29
FROM php:${PHP_VERSION}-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update \ 
&& apt-get upgrade -y --force-yes \ 
&& apt-get install -y --force-yes sudo curl wget git cron nano zip unzip \ 
&& chmod uga+x /usr/local/bin/install-php-extensions \
&& sync \ 
&& install-php-extensions mysqli pdo pdo_mysql zip gd bcmath intl gmp imagick exif opcache redis @composer \ 
&& a2enmod rewrite \
&& a2enmod proxy \
&& a2enmod proxy_http

WORKDIR /var/www/
