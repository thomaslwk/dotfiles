#!/bin/bash

# Install required tools for adding external repositories
echo "Installing required tools..."
sudo apt -y install lsb-release apt-transport-https ca-certificates curl wget

# Check if PHP is already installed
if command -v php &>/dev/null; then
  echo "PHP is already installed. Version: $(php -v | head -n 1)"
else
  echo "PHP is not installed. Proceeding with installation."
  # Add the PHP GPG key and repository
  echo "Adding PHP GPG key and repository..."
  wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg || {
    echo "Failed to download PHP GPG key"
    exit 1
  }
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

  # Update the package list again
  echo "Updating package list after adding PHP repository..."

  sudo apt update -y
  # Install PHP 8.4 and required extensions
  echo "Installing PHP 8.4 and extensions..."
  sudo apt -y install \
    php8.4-cli php8.4-dev \
    php8.4-pgsql php8.4-sqlite3 php8.4-gd \
    php8.4-curl php8.4-imap php8.4-mysql \
    php8.4-mbstring php8.4-xml php8.4-zip \
    php8.4-bcmath php8.4-intl php8.4-readline \
    php8.4-msgpack php8.4-igbinary php8.4-redis \
    php8.4-pcov php8.4-xdebug
  # Verify PHP installation
  echo "Verifying PHP installation..."
  php -v || {
    echo "PHP installation failed!"
    exit 1
  }
fi

# Check if Composer is already installed
if command -v composer &>/dev/null; then
  echo "Composer is already installed. Version: $(composer --version)"
else
  echo "Composer is not installed. Proceeding with installation."
  # Install Composer securely
  echo "Installing Composer..."
  EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)" || {
    echo "Failed to fetch Composer signature"
    exit 1
  }
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" || {
    echo "Failed to download Composer installer"
    exit 1
  }
  ACTUAL_SIGNATURE="$(php -r "echo hash_file('SHA384', 'composer-setup.php');")"
  if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]; then
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    echo "Composer installed successfully."
  else
    echo "ERROR: Invalid Composer installer signature."
    rm composer-setup.php
    exit 1
  fi

  # Cleanup Composer setup file
  rm composer-setup.php

  # Verify Composer installation
  echo "Verifying Composer installation..."
  composer --version || {
    echo "Composer installation failed!"
    exit 1
  }
fi

# Update the package list
echo "Updating package list..."
sudo apt update -y

echo "PHP 8.4 and Composer installation completed successfully."
