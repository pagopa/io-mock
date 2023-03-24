FROM functions-node-14

ARG FUNCTIONS_APP_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-app.git /usr/src/app && \
  git checkout $FUNCTIONS_APP_COMMIT_SHA && \
  yarn install --frozen-lockfile && \
  yarn build && \
  func extensions install

CMD ["func", "start", "--javascript"]
