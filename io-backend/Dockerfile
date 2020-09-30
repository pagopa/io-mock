FROM node:10.14.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG COMMIT_SHA
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN rm -rf * && \
    git clone https://github.com/pagopa/io-backend.git /usr/src/app && \
    git checkout $COMMIT_SHA

RUN ./scripts/init-npm.sh

RUN yarn install && \
    yarn generate:proxy-models && \
    yarn build

EXPOSE 443

CMD ["node", "src/server.js"]