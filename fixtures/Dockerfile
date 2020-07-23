FROM node:10.14.2-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /opt/cosmosdb

RUN npm install -g ts-node typescript && \
    npm install documentdb @types/documentdb io-functions-commons@8.0.0 \
                io-ts@1.8.5 fp-ts@1.17.4 italia-ts-commons@7.0.1 @azure/storage-blob@^10.5.0

COPY fixtures/index.ts /opt/cosmosdb

CMD ["sh", "-c", "ts-node index"]
