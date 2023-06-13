#!/bin/sh

echo "[Inception-Redis] Update configuration files..."

#redis-server --protected-mode no --demonize yes

#sleep 5

chmod +w /etc/redis/redis.conf

sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf

#redis-cli shutdown
redis-server /etc/redis/redis.conf --protected-mode no --daemonize yes
sleep 5

echo "[Inception-Redis] Done."

# Keep the container running
tail -f /dev/null