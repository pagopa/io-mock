FROM node:18.13.0-alpine

RUN apk update && apk upgrade && \
  apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG IO_BACKEND_COMMIT_SHA
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN rm -rf * && \
  git clone https://github.com/pagopa/io-backend.git /usr/src/app && \
  git checkout $IO_BACKEND_COMMIT_SHA

RUN yarn install --frozen-lockfile && \
  yarn generate:proxy-models && \
  yarn build

EXPOSE 443

CMD ["node", "src/server.js"]
