cp /vagrant/sources/hosts /etc/hosts

bash -c "echo 'deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse' > /etc/apt/sources.list.d/mongodb-org-4.2.list"

apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

apt-get update

apt-get install -y mongodb-org

service mongod start

ipaddr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`
sed -i "s/bindIp: 127.0.0.1/bindIp: $ipaddr/" /etc/mongod.conf

mongo mongo-query-router:27017 -u mongo-admin -p --authenticationDatabase admin

mongo --eval 'sh.addShard( "mongo-shard-1:27017" )'
mongo --eval 'sh.addShard( "mongo-shard-2:27017" )'

mongo --eval 'sh.addShard( "rs0/mongo-repl-1:27017,mongo-repl-2:27017,mongo-repl-3:27017" )'
