FROM node:12-alpine@sha256:d4b15b3d48f42059a15bd659be60afe21762aae9d6cbea6f124440895c27db68

WORKDIR /opt/cosmosdb

RUN npm install -g @zeit/cosmosdb-server@0.13.4 ts-node

CMD ["sh", "-c", "cosmosdb-server -p 3000"]
