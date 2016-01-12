check() {
    echo "Checking node..."
    NODE_PATH=`which node`
    if [ "$NODE_PATH" == "node not found" ]; then
        return 0
    else
        return 1
    fi
}

install() {
    echo "Node not found! Installing Node..."
    brew install node
    if [ "$NVM_DIR" == "" ]; then
        echo "nvm not found! Installing nvm..."
        curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash
    fi
}

active() {
    node_ver=(${line})
    source $NVM_DIR/nvm.sh
    echo "Setting node version to ${node_ver[1]}..."
    nvm install v${node_ver[1]}
    nvm use ${node_ver[1]}
}
