FROM node:12-alpine

RUN apk update && apk upgrade && \
  apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG IO_PAGOPA_NODO_MOCK_COMMIT_SHA
ARG GITHUB_TOKEN
ARG PAGOPA_PORT
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN rm -rf * && \
  git clone https://github.com/pagopa/io-pagopa-node-mock.git /usr/src/app && \
  git checkout $IO_PAGOPA_NODO_MOCK_COMMIT_SHA

RUN yarn install --frozen-lockfile && \
  yarn build

EXPOSE ${PAGOPA_PORT}

CMD ["yarn", "start"]
