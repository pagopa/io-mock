FROM node:16-alpine

RUN apk update && apk upgrade && \
  apk add --no-cache bash ca-certificates git openssh openssl

WORKDIR /usr/src/app

ARG IO_PN_MOCK_COMMIT_SHA
ARG GITHUB_TOKEN
ENV GITHUB_TOKEN=${GITHUB_TOKEN}

RUN rm -rf * && \
  git clone https://github.com/pagopa/io-pn-mock.git /usr/src/app && \
  git checkout $IO_PN_MOCK_COMMIT_SHA

RUN yarn install --frozen-lockfile && \
  yarn generate && \
  yarn build

CMD ["yarn", "run", "start"]
