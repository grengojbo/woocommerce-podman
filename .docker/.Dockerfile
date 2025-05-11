FROM wordpress:fpm-alpine

# Install PhpRedis extension
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && apk del $PHPIZE_DEPS

# Enable SoapClient
RUN apk add --no-cache libxml2-dev \
    && docker-php-ext-install soap

# Install WP-CLI
RUN mkdir -p /tmp/wp-cli && cd /tmp/wp-cli \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
