FROM php:7.4-fpm

# Copy composer.lock and composer.json in container
COPY composer.lock composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install depedencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Clear cache
#RUN apt-get clean & rm -rf /var/lib/apt/list/*

# Install extensions
# RUN docker-php-ext-configure gd --with-gd --with-freetype --with-jpeg
# RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Add user for laravel
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permission
COPY --chown=www:www . /var/www

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]