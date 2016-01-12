check() {
    echo "Checking ruby..."
    RUBY_PATH=`which ruby`
    if [ "$RUBY_PATH" == "ruby not found" ]; then
        return 0
    else
        return 1
    fi
}

install() {
    echo "Ruby not found! Installing Ruby..."
    brew install ruby
    RVM_PATH=`which rvm`
    if [ "$RVM_PATH" == "" ]; then
        echo "rvm not found! Installing rvm..."
        curl -sSL https://get.rvm.io | bash -s stable
    fi
}

active() {
    ruby_ver=(${line})
    echo "Setting ruby version to ${ruby_ver[1]}..."
    rvm install ${ruby_ver[1]}
    rvm use ${ruby_ver[1]}
}
