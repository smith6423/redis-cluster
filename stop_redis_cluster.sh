
# Redis 클러스터 노드 종료 스크립트
for port in $(seq 7000 7005); do
  echo "Stopping Redis on port $port..."
  redis-cli -p $port -a yourStrongPassword shutdown
done

echo "🛑 All Redis nodes stopped."
