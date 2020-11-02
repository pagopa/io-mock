FROM node:10.14.1

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y lsb-release && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/debian/$(lsb_release -rs | cut -d'.' -f 1)/prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    apt-get update

RUN apt-get install -y azure-functions-core-tools && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dotnet-sdk-3.1

ENV AzureWebJobsScriptRoot=/usr/src/app \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

RUN curl https://raw.githubusercontent.com/vercel/cosmosdb-server/master/cert.pem -o /usr/local/share/ca-certificates/cert.pem && \
    openssl x509 -outform der -in /usr/local/share/ca-certificates/cert.pem -out /usr/local/share/ca-certificates/cert.crt && \
    chmod 644 /usr/local/share/ca-certificates/cert.crt && \
    update-ca-certificates

CMD ["func", "start", "--javascript"]
