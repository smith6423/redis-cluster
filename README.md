🛠️ 1. Redis 설치
```bash
sudo apt update
sudo apt install redis-server -y
```

설치 후 Redis 버전 확인:
```bash
redis-server --version
```

🛠️ 2. redis.conf 파일 생성 

create_redis_dirs.sh password 및 reids 설정 변경

```bash
chmod -x create_redis_dirs.sh
./create_redis_dirs.sh
```

🛠️ 2. redis.conf 파일 생성 
```bash
chmod -x create_redis_node.sh
./create_redis_node.sh
```

🛠️ 3. cluster 구성
```bash
chmod -x start_redis_cluster.sh
./start_redis_cluster.sh
```
