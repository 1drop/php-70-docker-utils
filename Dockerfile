FROM php:7.0

RUN apt-get update -yqq
RUN apt-get install openssh-client git unzip ansible zlib1g-dev git-lfs -yqq
RUN ansible-galaxy install carlosbuenosvinos.ansistrano-deploy carlosbuenosvinos.ansistrano-rollback
RUN curl -Lo /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && chmod +x /usr/local/bin/phpunit
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN curl -Lo git-lfs.tar.gz https://github.com/github/git-lfs/releases/download/v1.4.4/git-lfs-linux-amd64-1.4.4.tar.gz \
    && tar xzf git-lfs.tar.gz && cd git-lfs-1.4.4 && ./install.sh && cd .. && rm -rf git-lfs*

