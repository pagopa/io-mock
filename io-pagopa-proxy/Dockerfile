FROM node:10.14.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG COMMIT_SHA
ARG GITHUB_TOKEN
ARG PAGOPAPROXY_PORT
ARG PAGOPA_PORT
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN rm -rf * && \
    git clone https://github.com/pagopa/io-pagopa-proxy.git /usr/src/app && \
    git checkout $COMMIT_SHA

RUN yarn install && \
    yarn build

EXPOSE ${PAGOPA_PORT}
EXPOSE ${PAGOPAPROXY_PORT}

CMD ["node", "dist/src/index.js"]