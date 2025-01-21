FROM node:14.16.0@sha256:f6b9ff4caca9d4f0a331a882e560df242eb332b7bbbed2f426784de208fcd7bd

WORKDIR /usr/src/app

RUN npm i -g azure-functions-core-tools@4 --unsafe-perm true

ENV AzureWebJobsScriptRoot=/usr/src/app \
  AzureFunctionsJobHost__Logging__Console__IsEnabled=true

CMD ["func", "start", "--javascript"]
