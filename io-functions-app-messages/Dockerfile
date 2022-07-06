FROM functions-node-14

ARG FUNCTIONS_APP_MESSAGES_COMMIT_SHA


RUN     git clone https://github.com/pagopa/io-functions-app-messages.git /usr/src/app && \
  git checkout $FUNCTIONS_APP_MESSAGES_COMMIT_SHA && \
  yarn install --frozen-lockfile && \
  yarn build && \
  func extensions install

CMD ["func", "start", "--javascript"]
