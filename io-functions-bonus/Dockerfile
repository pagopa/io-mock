FROM functions

ARG FUNCTIONS_BONUS_BRANCH

RUN git clone https://github.com/pagopa/io-functions-bonus.git /usr/src/app && \
         git checkout $FUNCTIONS_BONUS_BRANCH && \
         yarn install && \
         yarn build && \
         func extensions install

CMD ["func", "start", "--javascript"]
