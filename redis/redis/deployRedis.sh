# Basic util
source /vagrant/util.sh

# Redis Installation
apt update
apt install -y redis-server redis-sentinel

# Enabling firewall
ufw allow 6379
ufw allow 26379

cp /vagrant/redis/redis.conf /etc/redis.conf
sed -i "s/127.0.0.1/$ip_addr/" /etc/redis.conf

if [[ $ip_addr != $ip_redis_master ]]; then
	echo "slaveof $ip_redis_master 6379" >> /etc/redis.conf
fi

cp /vagrant/redis/redis-sentinel.conf /etc/redis-sentinel.conf
sed -i "s/127.0.0.1/$ip_addr/" /etc/redis-sentinel.conf
sed -i "s/127.0.0.2/$ip_redis_master/" /etc/redis-sentinel.conf

redis-server /etc/redis.conf &
redis-sentinel /etc/redis-sentinel.conf &