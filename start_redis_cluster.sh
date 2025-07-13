
# Redis 비밀번호
PASSWORD="yourStrongPassword"

# Redis 노드 목록
NODES=(
  "127.0.0.1:7000"
  "127.0.0.1:7001"
  "127.0.0.1:7002"
  "127.0.0.1:7003"
  "127.0.0.1:7004"
  "127.0.0.1:7005"
)

# redis-cli 경로 (기본적으로는 그냥 redis-cli)
REDIS_CLI="redis-cli"

# 노드들을 하나의 문자열로 연결
NODE_ARGS=""
for NODE in "${NODES[@]}"; do
  NODE_ARGS+="$NODE "
done

# 클러스터 생성 명령 실행
$REDIS_CLI --cluster create $NODE_ARGS --cluster-replicas 1 -a "$PASSWORD"
