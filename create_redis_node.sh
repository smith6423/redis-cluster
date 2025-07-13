# Redis 클러스터 노드 실행 스크립트 (포트: 7000~7005)
for port in $(seq 7000 7005); do
  echo "Starting Redis on port $port..."
  redis-server ~/redis-cluster/$port/redis.conf
done

echo "✅ All Redis nodes started."
