# authServer
oAuth authentication server with rights management




## Configure MySQL
BY default this OAuth server uses a SQLite database. This are instructions how you can create a database in MySQL. 


Database name and user name are just examples, you can choose whatever you want.
```bash
export SQL_PASSWORD=<secret>
export DB_NAME="SequenceCenterUsers"
export DB_USER="sequser"
export USER_PASSWORD="<another_secret>"
export HOST_PREFIX="bio-worker"
```

Create database:

mysql -u root --password=***
```bash
CREATE DATABASE ${DB_NAME};
```

Create tables
```bash
cat dbsetup.mysql | mysql -u root --password=${SQL_PASSWORD} ${DB_NAME}
```

Create users:
(We are using a for loop to loop over multiple hosts)

```bash
for i in {1..21} ; do mysql -u root --password=${SQL_PASSWORD} ${DB_NAME} --execute "CREATE USER IF NOT EXISTS '${DB_USER}'@'${HOST_PREFIX}${i}.mcs.anl.gov' IDENTIFIED BY '${USER_PASSWORD}';"  ; done
```

Give permissions:
```bash
for i in {1..21} ; do mysql -u root --password=${SQL_PASSWORD} ${DB_NAME}  --execute "GRANT SELECT, INSERT, UPDATE, DELETE on ${DB_NAME} .* to '${DB_USER}'@'${HOST_PREFIX}${i}.mcs.anl.gov';" ; done
```

## register an application
By default application registration is disabled. To enable it, set
ALLOW_REGISTER_APPLICATION in OAuthConfig.pm to 1. The application
base url will then provide an app registration form. Make sure to use
the full URL including your service script name (i.e. client.cgi). You
will receive a secret that must be used by the app to verify against
the oAuth server. After your app is registered you probably want to
set the configuration variable back to 0.
