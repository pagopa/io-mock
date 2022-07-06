FROM node:12-alpine

RUN apk update && apk upgrade && \
  apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG NOTIFICATION_HUB_COMMIT_SHA

RUN rm -rf * && \
  git clone https://github.com/pagopa/io-notification-hub-mock.git /usr/src/app && \
  git checkout $NOTIFICATION_HUB_COMMIT_SHA

RUN yarn install --frozen-lockfile && \
  yarn build

EXPOSE 30000

CMD ["yarn", "start"]
