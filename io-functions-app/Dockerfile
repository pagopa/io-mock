FROM functions

ARG FUNCTIONS_APP_BRANCH

RUN git clone https://github.com/pagopa/io-functions-app.git /usr/src/app && \
         git checkout $FUNCTIONS_APP_BRANCH && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
