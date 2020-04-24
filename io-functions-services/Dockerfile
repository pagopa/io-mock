FROM functions

RUN git clone https://github.com/pagopa/io-functions-services.git /usr/src/app && \
         git checkout $FUNCTIONS_SERVICES_BRANCH && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start"]