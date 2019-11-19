# Changing the APT sources.list to kambing.ui.ac.id
sudo cp '/vagrant/sources.list' '/etc/apt/sources.list'

# Updating the repo with the new sources
sudo apt-get update -y

cd /tmp

sudo apt install -y htop nano curl libaio1 haproxy\
    libmecab2 libnuma1 perl psmisc net-tools uuid-runtime

sudo apt install -y mysql-client

sudo ufw allow 33061
sudo ufw allow 3306
sudo ufw allow 6033
sudo ufw allow 9201

sudo cp '/vagrant/load_balancer/haproxy.cfg' '/etc/haproxy/haproxy.cfg'
sudo service haproxy restart

#mysql -u admin -padmin -h 127.0.0.1 -P 6032 < /vagrant/proxysql.sql