FROM functions

ARG FUNCTIONS_CGN_MERCHANT_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-cgn-merchant.git /usr/src/app && \
         git checkout $FUNCTIONS_CGN_MERCHANT_COMMIT_SHA && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
