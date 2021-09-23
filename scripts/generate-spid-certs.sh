#!/usr/bin/env bash

docker build -t italia-backend/tools:1.0.0 docker/images/tools
docker run --rm -v "$PWD:/usr/src/app" -e "NODE_ENV=development" -w "/usr/src/app" italia-backend/tools:1.0.0 yarn build
docker run --rm -v "$PWD/../backend:/usr/src/app" -e "NODE_ENV=development" -w "/usr/src/app/certs" italia-backend/tools:1.0.0 yarn generate:test-certs
