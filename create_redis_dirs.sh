COMMON_CONF=~/redis-cluster/common.conf

cat <<EOF > $COMMON_CONF
##################################
# 네트워크 설정
##################################
bind 0.0.0.0
protected-mode no

##################################
# 클러스터 모드
##################################
cluster-enabled yes
cluster-node-timeout 5000

##################################
# 비밀번호 인증
##################################
requirepass yourStrongPassword
masterauth yourStrongPassword

##################################
# AOF 영속성 설정
##################################
appendonly yes
appendfilename "appendonly.aof"
appendfsync everysec
auto-aof-rewrite-percentage 100
auto-aof-rewrite-min-size 64mb

##################################
# 메모리 관리
##################################
maxmemory 512mb
maxmemory-policy allkeys-lru

##################################
# 보안: 위험 명령 제한
##################################
enable-debug-command no
enable-module-command no
enable-protected-configs no

##################################
# 성능 모니터링
##################################
slowlog-log-slower-than 10000
slowlog-max-len 256
latency-monitor-threshold 100
EOF

# 포트별 redis.conf 생성
for port in $(seq 7000 7005); do
  DIR=~/redis-cluster/$port
  mkdir -p $DIR

  cat <<EOF > $DIR/redis.conf
port $port
daemonize yes
logfile "$DIR/redis.log"
dir "$DIR"
cluster-config-file nodes-$port.conf

include $COMMON_CONF
EOF

  # 권한 정리
  chown -R ubuntu:ubuntu $DIR
done

echo "✅ Redis cluster config 생성 완료"
