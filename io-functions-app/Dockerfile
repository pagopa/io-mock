FROM functions

RUN git clone https://github.com/pagopa/io-functions-app.git /usr/src/app && \
         git checkout $FUNCTIONS_APP_BRANCH && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start"]