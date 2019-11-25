export ip_addr=`ifconfig | awk '/inet /{print $2}' | head -2 | tail -1`
export ip_redis_master=172.28.17.53