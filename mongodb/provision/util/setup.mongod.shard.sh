ipaddr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`
sed -i "s/bindIp: 127.0.0.1/bindIp: $ipaddr/" /etc/mongod.conf