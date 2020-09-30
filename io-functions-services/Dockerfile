FROM functions

ARG FUNCTIONS_SERVICES_BRANCH

RUN git clone https://github.com/pagopa/io-functions-services.git /usr/src/app && \
         git checkout $COMMIT_SHA && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
