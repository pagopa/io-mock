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

| name | description |
|-|-|
| *APP-NAME*_CONTEXT | The build context location of the app. A `Dockerfile` is expected to be there. |
| *APP-NAME*_BRANCH | The branch you want to build from. Used when the code is fetched from remote repo. |
| *APP-NAME*_PORT | The port the app listens to. You don't usually need to edit this. |

By default each app is executed against the last version on the `master` branch of its public repo. By using a different build context, it's possible to run local versions of the app. 

### Database and Storage
Database and storage are shared among each application in the mock.

| name | description |
|-|-|
| STORAGE_CONNECTION_STRING | Connection string for the Azure Storage used by this mock |
| COSMOSDB_URI | Uri of the Azure Cosmosdb instance used by this mock |
| COSMOSDB_KEY | Account Key for the Azure Cosmosdb instance used by this mock |
| COSMOSDB_NAME | Name of the database used by this mock |

### Private package registry
| name | description |
|-|-|
| GITHUB_TOKEN | Auth token to access our private Github registry. |


## Execute
```sh
yarn start # build and run all the containers defined in the docker-compose.yaml file
yarn stop # stops and destroy all the containers defined in the docker-compose.yaml file
```
