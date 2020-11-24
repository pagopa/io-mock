FROM node:10.14.2-alpine

WORKDIR /opt/cosmosdb

RUN npm install -g @zeit/cosmosdb-server@0.7.0 ts-node

COPY cosmosdb/key.pem /usr/local/lib/node_modules/@zeit/cosmosdb-server/key.pem
COPY cosmosdb/cert.pem /usr/local/lib/node_modules/@zeit/cosmosdb-server/cert.pem

CMD ["sh", "-c", "cosmosdb-server -p 3000"]
