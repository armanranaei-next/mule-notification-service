#### mule-4-application-template

In order to deploy correctly to Florence Next CH2 Private Space complete the following steps:

- [Setup settings.xml](setup-settings.md)

- Make deploy scripts executable(#SETUP make deploy scripts executable)

- Deploy the app(#Deploy the app)

### SETUP make deploy scripts executable

You have to make the deploy scripts executables.

```shell
chmod 777 ./scripts/deploy-to-sh2-dev.sh \
chmod 777 ./scripts/deploy-to-sh2-dev.sh
```

### Deploy the app
Deploy the app.
Deploy on DEV environment:

```shell
./scripts/deploy-to-sh2-dev.sh
```

Deploy on PROD environment:

```shell
./scripts/deploy-to-sh2-prod.sh
```