FROM node:12-alpine

WORKDIR /opt/cosmosdb

RUN npm install -g @zeit/cosmosdb-server@0.7.0 ts-node

CMD ["sh", "-c", "cosmosdb-server -p 3000"]
