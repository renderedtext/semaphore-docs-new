---
layout: post
title: Database access
category: The Semaphore platform
---

Databases included in the platform are listed on the [Supported stack](/docs/supported-stack.html) page. For database engines which require credentials, Semaphore exports working username and password in [environment variables](/docs/available-environment-variables.html) which you can use when [customizing your build](/docs/customizing-build-commands.html).

### Ruby projects

If your project settings have language set to Ruby, Semaphore automatically inserts a working database configuration file (usually `config/database.yml`) before the build begins, based on the database selected.

For Rails apps, project analysis also inserts `bundle exec rake db:setup` and `bundle exec rake db:test:prepare` into your build commands, which is enough for things to just work in most cases.

Semaphore does not create the database before your build begins. It is up to your build commands to do so.

## Creating a database manually

Here are a few examples how you can easily create different databases.

### MySQL

```bash
mysql -u $DATABASE_MYSQL_USERNAME -p$DATABASE_MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS "test_db";"
```

### PostgreSQL

```bash
createdb test_db -U $DATABASE_POSTGRESQL_USERNAME
```

### SQLite

```bash
sqlite3 ex3.db ""

# create table ('tbl1') and database ('ex3.db')
sqlite3 ex3.db "create table tbl1(one varchar(10), two smallint);"
```

### MongoDB

MongoDB doesn't provide a command to create a "database".

Actually, you don’t need to create it manually, because, MongoDB will create it on the fly, during the first time you save the value into the defined collection (or table in SQL), and database.

### Redis

Redis is running on the default port 6379.
