# Dokumentasi

## Setup

The overall design of the system will be as follow

![](img/cluster.png)

| Cluster             | Hostname     | IP Address   | Box                  | RAM Allocation |
| ---------------     | ------------ | -------------| -------------------- | ---------------|
| Database            | db           | 172.28.17.52 | bento/ubuntu-18.04   | 1024 MB        |
| Redis 1 (Master)    | redis1       | 172.28.17.53 | bento/ubuntu-18.04   | 1024 MB        |
| Redis 2 (Slave)     | redis2       | 172.28.17.54 | bento/ubuntu-18.04   | 1024 MB        |
| Redis 3 (Slave)     | redis3       | 172.28.17.55 | bento/ubuntu-18.04   | 1024 MB        |
| Wordpress 1         | webserver1   | 172.28.17.56 | bento/ubuntu-18.04   | 512 MB         |
| Wordpress 2         | webserver2   | 172.28.17.57 | bento/ubuntu-18.04   | 512 MB         |

## Configuration

### Wordpress Installation


## Load Testing

We'll use JMeter as tool to load testing the webserver capability.

## Reference

https://scalegrid.io/blog/using-redis-object-cache-to-speed-up-your-wordpress-installation/
https://www.linode.com/docs/databases/mongodb/build-database-clusters-with-mongodb/
https://www.digitalocean.com/community/tutorials/how-to-use-apache-jmeter-to-perform-load-testing-on-a-web-server
