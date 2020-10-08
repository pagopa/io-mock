FROM functions

ARG FUNCTIONS_PUBLIC_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-public.git /usr/src/app && \
         git checkout $FUNCTIONS_PUBLIC_COMMIT_SHA && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
