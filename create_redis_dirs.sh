for port in $(seq 7000 7005); do
  mkdir -p ~/redis-cluster/$port
  sudo cp /etc/redis/redis.conf ~/redis-cluster/$port/redis.conf
done
