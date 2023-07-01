# Docker image for documentation build with Sphinx.
# Copyright JAKOTA Design Group GmbH. All rights reserved.

#Download base image ubuntu 20.04
FROM ubuntu:20.04
LABEL maintainer="Thomas Lueder <lueder@jakota.de>"
LABEL version="1.0"
LABEL description="Docker image for documentation build with Sphinx."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y universe && \
    apt update -y && \
    apt dist-upgrade -y

# Install nginx and php-fpm from ubuntu repository
RUN apt-get install -y lbzip2 ssh sshpass rsync \
  # Graphics
  imagemagick graphicsmagick  \
  # Fonts
  fonts-freefont-otf fonts-dejavu fonts-dejavu-extra fonts-freefont-ttf \
  # Language-pack
  language-pack-de-base language-pack-de language-pack-gnome-de-base language-pack-gnome-de \
  language-pack-en-base language-pack-en language-pack-gnome-en-base language-pack-gnome-en locales tzdata \
  # Python
  python3 python3-pip python3-pil \
  --install-recommends

# Clean Up
RUN rm -rf /var/lib/apt/lists/* && \
    apt clean

# Set locale
RUN update-locale LANG=de_DE.UTF-8

# Set Timezone
RUN ln -fs /usr/share/zoneinfo/$timezone /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# Upggrade pip 
RUN python3 -m pip install --upgrade pip

# Install Sphinx
RUN pip install -U sphinx sphinx-autobuild sphinx_rtd_theme sphinxcontrib-phpdomain
