# Update repo

apt-get -qq update

# Install apache webserver

apt-get install -y apache2
echo 'ServerName 172.28.17.56' >> /etc/apache2/apache2.conf
systemctl restart apache2

ufw allow in "Apache Full"


# Install php and its extensions

apt-get install -y software-properties-common
add-apt-repository ppa:ondrej/php

apt update
apt install -y php php-curl php-gd php-mbstring php-xml \
				php-xmlrpc php-soap php-intl php-zip php-mysql

systemctl restart apache2

# Apache configuration for overrides and rewrite rules

mkdir /var/www/wordpress
cp /vagrant/webserver/wordpress.conf /etc/apache2/sites-available/ 

a2enmod rewrite
apache2ctl configtest

a2ensite wordpress
a2dissite 000-default

systemctl restart apache2

# Wordpress installation

cd /tmp
curl -O https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

touch /tmp/wordpress/.htaccess
cp /vagrant/webserver/wp-config.php /tmp/wordpress/wp-config.php
mkdir /tmp/wordpress/wp-content/upgrade
cp -a /tmp/wordpress/. /var/www/wordpress

# Configuring wordpress permissions

chown -R www-data:www-data /var/www/wordpress
find /var/www/wordpress/ -type d -exec chmod 750 {} \;
find /var/www/wordpress/ -type f -exec chmod 640 {} \;



