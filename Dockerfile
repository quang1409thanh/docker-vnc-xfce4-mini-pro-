FROM php:8.2-fpm

# Set working directory
WORKDIR /var/www/html/

# Install dependencies for the operating system software
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    libzip-dev \
    unzip \
    git \
    libonig-dev \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions for php
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd


# Copy existing application directory contents to the working directory
COPY . /var/www/html

# Install VNC server and a desktop environment
RUN apt-get update && apt-get install -y \
    tightvncserver \
    xfce4 \
    xfce4-goodies

# Set up VNC server
RUN mkdir ~/.vnc && echo "140903" | vncpasswd -f > ~/.vnc/passwd && \
    chmod 600 ~/.vnc/passwd
# Start VNC server, create a XFCE4 session, and then start php-fpm server
CMD  vncserver :1 -geometry 1920x1080 -depth 24 && DISPLAY=:1 startxfce4 & php-fpm

# Expose port 5901
EXPOSE 5901
