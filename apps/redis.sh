check() {
    echo "Checking redis..."
    MONGO_PATH=`which redis-server`
    if [ "$MONGO_PATH" == "redis-server not found" ]; then
        return 0
    else
        return 1
    fi
}

install() {
    echo "Redis not found! Installing Redis..."
    brew install redis
}

active() {
    redis_app=(${line})
    REDIS_CHECK=`lsof -i | grep redis`
    REDIS_PORT=${redis_app[1]}
    if [ "$REDIS_PORT" == "" ]; then
        REDIS_PORT="6379"
    fi
    if [[ "$REDIS_CHECK" == *"TCP *:$REDIS_PORT"* ]]; then
        echo "Redis is already running on port $REDIS_PORT"
    else
        redis-server --port $REDIS_PORT &
    fi
}
