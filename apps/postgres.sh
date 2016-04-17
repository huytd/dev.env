check() {
    echo "Checking postgres..."
    POSTGRES_PATH=$(which postgres)
    if [ "$POSTGRES_PATH" == "mongod not found" ]; then
        return 0
    else
        return 1
    fi
}

install() {
    echo "Postgres not found! Installing Postgres..."
    brew install postgres
}

active() {
    postgres_app=(${line})
    POSTGRES_CHECK=$(lsof -i | grep postgres)
    POSTGRES_PORT=${postgres_app[1]}
    if [ "$POSTGRES_PORT" == "" ]; then
        POSTGRES_PORT="27017"
    fi
    if [[ "$POSTGRES_CHECK" == *"postgres"* ]]; then
        echo "Postgres is already running on port $POSTGRES_PORT"
    else
        postgres -D /usr/local/var/postgres -p $POSTGRES_PORT &
    fi
}
