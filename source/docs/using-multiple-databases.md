---
layout: post
title: Manually creating the database
category: Customizing your build
---

You shouldn’t normally need to do that, as Semaphore automatically inserts a working database.yml in your project, based on the database selected in your project’s settings. On top of that, project analysis usually inserts `rake db:setup` and `rake db:test:prepare` build commands, which is enough in most cases.

For custom build scripts, you can use the database name and password specified by exported [environment variables](/docs/available-environment-variables.html).

Here are a few examples how you can easily create different databases:

## MySQL

```bash
mysql -u $DATABASE_MYSQL_USERNAME -p$DATABASE_MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS "test_db";"
```

## PostgreSQL

```bash
createdb test_db -U $DATABASE_POSTGRESQL_USERNAME
```

## SQLite

```bash
sqlite3 ex3.db ""

# create table ('tbl1') and database ('ex3.db')
sqlite3 ex3.db "create table tbl1(one varchar(10), two smallint);"
```

## MongoDB

MongoDB doesn't provide a command to create a "database".

Actually, you don’t need to create it manually, because, MongoDB will create it on the fly, during the first time you save the value into the defined collection (or table in SQL), and database.
