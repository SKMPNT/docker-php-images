ARG PHP_VERSION=8.0
FROM php:${PHP_VERSION}-apache

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN apt-get update \ 
&& apt-get upgrade -y \ 
&& apt-get install -y sudo curl wget git cron nano zip unzip \ 
&& chmod uga+x /usr/local/bin/install-php-extensions \
&& sync \ 
&& install-php-extensions mysqli pdo pdo_mysql zip gd bcmath mbstring intl gmp imagick exif opcache @composer \ 
&& a2enmod rewrite \
&& a2enmod proxy \
&& a2enmod proxy_http

WORKDIR /var/www/