# authServer
oAuth authentication server with rights management




## Configure MySQL

```bash
export SQL_PASSWORD=<secret>
export DB_NAME="SequenceCenterUsers"
export DB_USER="sequser"
export HOST_PREFIX="bio-worker"
```

Create database:

mysql -u root --password=***
```bash
CREATE DATABASE ${DB_NAME};
```

Create tables
```bash
cat dbsetup.sql | mysql -u root --password=${SQL_PASSWORD} ${DB_NAME}
```

Create users:
(We are using a for loop to loop over multiple hosts)

```bash
for i in {1..21} ; do mysql -u root --password=${SQL_PASSWORD} ${DB_NAME} --execute "CREATE USER IF NOT EXISTS '${DB_USER}'@'${HOST_PREFIX}${i}.mcs.anl.gov';"  ; done
```

Give permissions:
```bash
for i in {1..1} ; do echo mysql -u root --password=${SQL_PASSWORD} ${DB_NAME}  --execute "GRANT SELECT, INSERT, UPDATE, DELETE on ${DB_NAME} .* to '${DB_USER}'@'${HOST_PREFIX}${i}.mcs.anl.gov';" ; done
```

