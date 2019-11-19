# specific cfgsrv

sed -i 's/port: 27017/port: 27019/' /etc/mongod.conf
sed -i "s/bindIp: 127.0.0.1/bindIp: $ipaddr/" /etc/mongod.conf

bash -c "echo 'replication:' >> /etc/mongod.conf"
bash -c "echo '    replSetName: configReplSet' >> /etc/mongod.conf"

bash -c "echo 'sharding:' >> /etc/mongod.conf"
bash -c "echo '    clusterRole: \"configsvr\"' >> /etc/mongod.conf"

service mongod restart

sleep 4