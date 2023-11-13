FROM functions-node-18

ARG FUNCTIONS_PUBLIC_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-public.git /usr/src/app && \
  git checkout $FUNCTIONS_PUBLIC_COMMIT_SHA && \
  yarn install --frozen-lockfile && \
  yarn build && \
  func extensions install

CMD ["func", "start", "--javascript"]
