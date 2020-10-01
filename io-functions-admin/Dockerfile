FROM functions

ARG COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-admin.git /usr/src/app && \
         git checkout $COMMIT_SHA && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]