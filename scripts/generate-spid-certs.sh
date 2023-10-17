#!/usr/bin/env bash

function info() {
    echo -e "\033[1;32m ============================================= \033[0m"
    echo -e "\033[1;32m $1 \033[0m"
    echo -e "\033[1;32m ============================================= \033[0m"
}

info "Creating certificates..."
docker build -t italia-backend/tools:1.0.0 docker/images/tools
docker run --rm -v "$PWD:/usr/src/app" -e "NODE_ENV=development" -w "/usr/src/app" italia-backend/tools:1.0.0 yarn generate-test-certs

info "Starting backend..."
yarn start -d redis-cluster backend

info "Waiting for metadata..."
sleep 15s
curl --insecure --retry-connrefused --retry 5 --retry-delay 30 --retry-max-time 150 https://localhost:8000/metadata -o ./testenv2/conf/sp_metadata.xml

info "Stopping backend..."
yarn stop
