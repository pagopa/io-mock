FROM node:10.14.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG IO_FIXTURES_COMMIT_SHA

RUN rm -rf * && \
    git clone https://github.com/pagopa/io-fixtures.git /usr/src/app && \
    git checkout $IO_FIXTURES_COMMIT_SHA

RUN yarn install

CMD ["yarn", "start"]
