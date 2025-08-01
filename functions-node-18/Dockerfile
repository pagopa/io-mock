FROM node:18.13.0@sha256:d871edd5b68105ebcbfcde3fe8c79d24cbdbb30430d9bd6251c57c56c7bd7646

WORKDIR /usr/src/app

RUN apt-get install git

RUN npm i -g azure-functions-core-tools@4 --unsafe-perm true

ENV AzureWebJobsScriptRoot=/usr/src/app \
  AzureFunctionsJobHost__Logging__Console__IsEnabled=true

CMD ["func", "start", "--javascript"]
