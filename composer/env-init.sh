apt-get install php7.0 php7.0-mbstring php7.0-xml php7.0-curl php7.0-gd -y &&
curl -sS https://getcomposer.org/installer | php &&
mv composer.phar /usr/local/bin/composer &&
export COMPOSER_ALLOW_SUPERUSER=1 &&
clear