FROM functions

ARG FUNCTIONS_PAYMENTMANAGER_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-paymentmanager.git /usr/src/app && \
         git checkout $FUNCTIONS_PAYMENTMANAGER_COMMIT_SHA && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
