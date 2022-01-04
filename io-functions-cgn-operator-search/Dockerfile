FROM functions-node-14

ARG FUNCTIONS_CGN_OPERATOR_SEARCH_COMMIT_SHA

RUN git clone https://github.com/pagopa/io-functions-cgn-operator-search.git /usr/src/app && \
         git checkout $FUNCTIONS_CGN_OPERATOR_SEARCH_COMMIT_SHA && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
