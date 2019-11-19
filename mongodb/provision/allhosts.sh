wget http://0x0.st/z6JT.yaml
mv z6JT.yaml /etc/netplan/50-cloud-init.yaml

macaddr=`lshw -class network | awk '/serial: /{print $2}' | tail -1`
ipaddr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`

sed -i "s/10.130.18.92/$ipaddr/" /etc/netplan/50-cloud-init.yaml
sed -i "s/f2:08:c3:43:05:04/$macaddr" /etc/netplan/50-cloud-init.yaml

bash -c "echo 'deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse' > /etc/apt/sources.list.d/mongodb-org-4.2.list"

apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | apt-key add -

apt-get update

apt-get install -y mongodb-org

service mongod start

sleep 4