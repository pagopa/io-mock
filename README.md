# io-mock

Docker files to replicate the whole IO backend platform locally for development purposes and integration tests

## Prepare

Before launch the mock the first time, the following steps need to be completed:

### Setup your local hosts file

This is needed to access apps using Traefik virtual hosts. Add the following to your hosts file:

```ini
127.0.0.1    backend.localhost functions-admin.localhost functions-app.localhost functions-public.localhost functions-services.localhost
```

### Setup environment values

```sh
cp env.example .env
```

then change values into `.env` based on your needs. **Such file must never be committed**

## Configure execution

Configuration is done by editing your local `.env` file

### Apps

Each app is configured with a triplet of environment variables:

| name                | description                                                                        |
| ------------------- | ---------------------------------------------------------------------------------- |
| _APP-NAME_\_CONTEXT | The build context location of the app. A `Dockerfile` is expected to be there.     |
| _APP-NAME_\_BRANCH  | The branch you want to build from. Used when the code is fetched from remote repo. |
| _APP-NAME_\_PORT    | The port the app listens to. You don't usually need to edit this.                  |

By default each app is executed against the last version on the `master` branch of its public repo. By using a different build context, it's possible to run local versions of the app.

### Database and Storage

Database and storage are shared among each application in the mock.

| name                      | description                                                   |
| ------------------------- | ------------------------------------------------------------- |
| STORAGE_CONNECTION_STRING | Connection string for the Azure Storage used by this mock     |
| COSMOSDB_URI              | Uri of the Azure Cosmosdb instance used by this mock          |
| COSMOSDB_KEY              | Account Key for the Azure Cosmosdb instance used by this mock |
| COSMOSDB_NAME             | Name of the database used by this mock                        |

### Private package registry

| name         | description                                       |
| ------------ | ------------------------------------------------- |
| GITHUB_TOKEN | Auth token to access our private Github registry. |

### Generate new SPID certs and metadata
This is useful when the provided ones are expired.

Within io-mock folder, run:
* `rm -rf io-backend/certs/*` 
* `yarn generate-spid-certs`

Check that:
* new `cert.pem` and `key.pem` are created inside `io-backend/certs`,
* `sp_metadata.xml` is updated inside `testenv2/conf`.

## Execute

```sh
yarn start # build and run all the containers defined in the docker-compose.yaml file
yarn start -d # same but with detatched execution
yarn stop # stops and destroy all the containers defined in the docker-compose.yaml file
```
> *NOTE*: before doing this make sure you have launched `yarn install`  
## Run from local directory

By default all services are built from a branch checked out from the relative git repository.
Sometimes it's desiderable to test a service built from a local directory instead
to enabled hot reloading of changes, without the need to push local changes to the git branch.

In order to do that, add a `docker-compose.override.yml` file in the root dir of io-mock,
with the following content:

```yaml
version: "3.2"

services:
  functions-admin:
    build:
      context: base/functions
    volumes:
      - "../io-functions-admin:/usr/src/app"
      # use
      # - "../io-functions-admin:/usr/src/app:delegated"
      # if you're on Mac to avoid CPU exhaustion
    ports:
      - ${FUNCTIONS_ADMIN_PORT}:7071
      # node inspector
      - "5861:5861"
    command: ["func", "start", "--javascript"]
    environment:
      - languageWorkers__node__arguments="--inspect=0.0.0.0:5861"
    labels:
      - traefik.http.services.functions-admin.loadbalancer.server.port=7071

  # or, for io-backend:

  backend:
    build:
      context: base/node
    volumes:
      - "../io-backend:/usr/src/app:cached"
    working_dir: /usr/src/app
```

To debug such a service add these lines into `.vscode/launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "attach",
      "name": "Docker: Attach to Node",
      "protocol": "auto",
      "port": 5861,
      "restart": true,
      "localRoot": "${workspaceFolder}",
      "remoteRoot": "/usr/src/app",
      "outFiles": ["${workspaceFolder}/dist/**/*.js"],
      "skipFiles": ["<node_internals>/**/*.js"]
    }
  ]
}
```

Ensure that the VSCode debugger port (`5861` in the example above) match the one exposed by docker.


## Run tests

A set of Postman tests can be found in `postman-test-collections`.
To run them, just run the mock enviroment and then call

``` bash
yarn test
```

### Add new test

Create a new postman collection within `postman-test-collections` folder and add a new `"test:___` script in `package.json`