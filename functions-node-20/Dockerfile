FROM node:20.12.2@sha256:3864be2201676a715cf240cfc17aec1d62459f92a7cbe7d32d1675e226e736c9

WORKDIR /usr/src/app

RUN npm i -g azure-functions-core-tools@4 --unsafe-perm true

ENV AzureWebJobsScriptRoot=/usr/src/app \
  AzureFunctionsJobHost__Logging__Console__IsEnabled=true

CMD ["func", "start", "--javascript"]
