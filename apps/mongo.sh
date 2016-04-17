check() {
    echo "Checking mongo..."
    MONGO_PATH=$(which mongod)
    if [ "$MONGO_PATH" == "mongod not found" ]; then
        return 0
    else
        return 1
    fi
}

install() {
    echo "Mongo not found! Installing Mongo..."
    brew install mongo
}

active() {
    mongo_app=(${line})
    MONGO_CHECK=$(lsof -i | grep mongo)
    MONGO_PORT=${mongo_app[1]}
    if [ "$MONGO_PORT" == "" ]; then
        MONGO_PORT="27017"
    fi
    if [[ "$MONGO_CHECK" == *"TCP *:$MONGO_PORT"* ]]; then
        echo "Mongo is already running on port $MONGO_PORT"
    else
        mongod --fork --logpath mongo.log --port $MONGO_PORT
    fi
}
