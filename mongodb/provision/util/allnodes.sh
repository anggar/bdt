cp /vagrant/sources/hosts /etc/hosts
sudo cp /vagrant/sources/mongodb-org-4.2.list /etc/apt/sources.list.d/

apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

apt-get update

apt-get install -y mongodb-org

service mongod start
