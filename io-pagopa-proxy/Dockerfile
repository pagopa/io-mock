FROM node:12-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG IO_PAGOPA_PROXY_COMMIT_SHA
ARG GITHUB_TOKEN
ARG PAGOPAPROXY_PORT
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN rm -rf * && \
    git clone https://github.com/pagopa/io-pagopa-proxy.git /usr/src/app && \
    git checkout $IO_PAGOPA_PROXY_COMMIT_SHA

RUN yarn install && \
    yarn build

EXPOSE ${PAGOPAPROXY_PORT}

CMD ["node", "dist/src/index.js"]