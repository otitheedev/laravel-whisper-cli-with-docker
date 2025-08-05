FROM php:8.2-cli

# System packages
RUN apt-get update && \
    apt-get install -y \
    git zip unzip ffmpeg python3 python3-pip python3-venv

# Composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

# Whisper installation
RUN pip3 install git+https://github.com/openai/whisper.git

# Create app folder
WORKDIR /var/www

# Laravel needs these
RUN curl -sS https://getcomposer.org/installer | php && \
    php composer.phar create-project laravel/laravel .

# Set file permissions
RUN chown -R www-data:www-data /var/www
