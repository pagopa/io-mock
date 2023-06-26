FROM functions-node-18

ARG FUNCTIONS_LOLLIPOP_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-lollipop.git /usr/src/app && \
  git checkout $FUNCTIONS_LOLLIPOP_COMMIT_SHA && \
  yarn install --frozen-lockfile && \
  yarn build && \
  func extensions install

CMD ["func", "start", "--javascript"]
