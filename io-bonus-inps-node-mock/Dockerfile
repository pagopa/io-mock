FROM node:10.14.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG IO_BONUS_INPS_MOCK_BRANCH

RUN rm -rf * && \
    git clone https://github.com/pagopa/io-bonus-inps-node-mock.git /usr/src/app && \
    git checkout ${IO_BONUS_INPS_MOCK_BRANCH}

RUN yarn install && \
  yarn build

EXPOSE 3003

CMD ["yarn", "start"]