# Update repo

sudo apt-get -qq update

# Install apache webserver

sudo apt-get install -y apache2
sudo echo 'ServerName 172.28.17.56' >> /etc/apache2/apache2.conf
sudo systemctl restart apache2

sudo ufw allow in "Apache Full"


# Install php and its extensions

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php

sudo apt update
sudo apt install -y php7.3 php7.3-cli php7.3-common php7.3-fpm \
    php7.3-json php7.3-opcache php7.3-mysql php7.3-mbstring php7.3-zip \
    php7.3-bcmath php7.3-intl php7.3-xml php7.3-curl php7.3-gd php7.3-gmp

# Install composer

cd /tmp
sudo curl -s https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer
sudo rm -f composer-setup.php

# Clone repository

cd /var/www
sudo git clone https://github.com/realworldhq/realworld.git

# Configure app

cd /var/www/realworld
sudo cp .env.example .env
sudo sed -i 's/APP_ENV=production'
sudo sed -i 's/DB_HOST=127.0.0.1/DB_HOST=172.28.17.53/' .env
sudo sed -i 's/DB_DATABASE=/DB_DATABASE=realworld/' .env
sudo sed -i 's/DB_USERNAME=homestead/DB_USERNAME=root/' .env
sudo sed -i 's/DB_PASSWORD=secret/DB_PASSWORD=admin/' .env

sudo composer install --no-interaction --no-suggest --no-dev
sudo php artisan key:generate
sudo php artisan setup:production -v

# Configure Apache

sudo chown -R www-data:www-data /var/www/realworld
sudo chmod -R 775 /var/www/realworld/storage


cd /etc/apache2/sites-available
sudo a2enmod rewrite

sudo cp 000-default.conf realworld.conf
# sudo sed -i 's/#ServerName www.example.com/ServerName 172.28.17.56/' realworld.conf
sudo sed -i 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/realworld/public/' realworld.conf
sudo sed -i 's/AllowOverride None/AllowOverride All/' realworld.conf
sudo sed -i 's/Options FollowSymlinks/Options Indexes FollowSymlinks/' realworld.conf

# Apply apache conf

sudo a2dissite 000-default.conf
sudo a2ensite realworld.conf

# Enable php7.3 fpm, and restart apache
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.3-fpm
sudo service php7.3-fpm restart
sudo service apache2 restart