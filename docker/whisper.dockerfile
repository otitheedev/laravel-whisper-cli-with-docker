# docker/whisper.dockerfile

FROM php:8.2-cli

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    ffmpeg \
    libsndfile1 \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Create virtualenv for whisper
RUN python3 -m venv /opt/venv

# Upgrade pip and install whisper
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install git+https://github.com/openai/whisper.git

# Install Composer
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Add Laravel and app source via docker-compose bind mount
