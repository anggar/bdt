cp /vagrant/sources/hosts /etc/hosts
cp /vagrant/provision/query-router/mongos.conf /etc/mongos.conf
cp /vagrant/provision/query-router/mongos.service /lib/systemd/system/mongos.service

ipaddr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`
sed -i "s/bindIp: 192.0.2.4/bindIp: $ipaddr/" /etc/mongos.conf

systemctl stop mongod
sudo systemctl enable mongos.service
sudo systemctl start mongos