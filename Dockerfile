FROM php:7.0

RUN apt-get update -yqq
RUN apt-get install openssh-client git unzip ansible zlib1g-dev wget libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libcurl4-gnutls-dev libxml2-dev -yqq
RUN ansible-galaxy install carlosbuenosvinos.ansistrano-deploy,1.12.0 carlosbuenosvinos.ansistrano-rollback,1.5.0
RUN curl -Lo /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit
RUN docker-php-ext-install pdo pdo_mysql gd zip simplexml
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN curl -Lo git-lfs.tar.gz https://github.com/git-lfs/git-lfs/releases/download/v1.5.5/git-lfs-linux-amd64-1.5.5.tar.gz \
    && tar xzf git-lfs.tar.gz && cd git-lfs-1.5.5 && ./install.sh && cd .. && rm -rf git-lfs*

