---
layout: post
title: SQLite
category: Databases
---

If you need to create a SQLite database manually, you can use the following
command:

```bash
# create database 'test_database.db'
sqlite3 test_database.db ""

# create database 'test_database.db' and table 'posts'
sqlite3 test_database.db "create table posts(title varchar(50));"
```
