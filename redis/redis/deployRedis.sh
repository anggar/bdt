# Basic util
source /vagrant/util.sh
export ip_addr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`

# Redis Installation
apt-get update 
apt-get install -y gcc build-essential tcl libjemalloc-dev
curl -O http://download.redis.io/redis-stable.tar.gz
tar xzvf redis-stable.tar.gz
cd redis-stable
make distclean
make test
make install

# Enabling firewall
ufw allow 6379
ufw allow 26379

cp /vagrant/redis/redis.conf /etc/redis.conf
sed -i "s/127.0.0.1/$ip_addr/" /etc/redis.conf

if [ $ip_addr != "172.28.17.53" ]; then
	echo "slaveof $ip_redis_master 6379" >> /etc/redis.conf
fi

cp /vagrant/redis/redis-sentinel.conf /etc/redis-sentinel.conf
sed -i "s/127.0.0.1/$ip_addr/" /etc/redis-sentinel.conf
sed -i "s/127.0.0.2/$ip_redis_master/" /etc/redis-sentinel.conf

redis-server /etc/redis.conf &
redis-sentinel /etc/redis-sentinel.conf &