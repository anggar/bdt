cp /vagrant/sources/hosts /etc/hosts

# For config server 2
# http://0x0.st/z6yA.sh 

bash -c "echo 'deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse' > /etc/apt/sources.list.d/mongodb-org-4.2.list"

apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

apt-get update

apt-get install -y mongodb-org

service mongod start

sleep 4

# specific cfgsrv

ipaddr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`

sed -i 's/port: 27017/port: 27019/' /etc/mongod.conf
sed -i "s/bindIp: 127.0.0.1/bindIp: $ipaddr/" /etc/mongod.conf

bash -c "echo 'replication:' >> /etc/mongod.conf"
bash -c "echo '    replSetName: configReplSet' >> /etc/mongod.conf"

bash -c "echo 'sharding:' >> /etc/mongod.conf"
bash -c "echo '    clusterRole: \"configsvr\"' >> /etc/mongod.conf"

service mongod restart

sleep 4