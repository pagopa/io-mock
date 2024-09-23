FROM node:18.13.0

WORKDIR /usr/src/app

RUN apt-get install git

RUN npm i -g azure-functions-core-tools@4 --unsafe-perm true

ENV AzureWebJobsScriptRoot=/usr/src/app \
  AzureFunctionsJobHost__Logging__Console__IsEnabled=true

CMD ["func", "start", "--javascript"]
