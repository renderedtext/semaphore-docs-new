---
layout: post
title: SQLite
category: Databases
---

You can find out the version of SQLite you are using by executing `sqlite3 -version`.

If you need to create a SQLite database manually, you can use the following
command:

```bash
# create database 'test_database.db'
sqlite3 test_database.db ""

# create database 'test_database.db' and table 'posts'
sqlite3 test_database.db "create table posts(title varchar(50));"
```

The list of all supported packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.
