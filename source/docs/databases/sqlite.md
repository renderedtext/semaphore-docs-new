---
layout: post
title: SQLite
category: Databases
---

This document contains information related to projects based on the Ubuntu 14.04 image. 
If you are using the Ubuntu 18.04 image for your projects, please refer to [this page](https://semaphoreci.com/docs/ubuntu-1804.html). 

If you are using the Ubuntu 14.04 image and you want to switch to Ubuntu 18.04, be sure to check our [upgrade guide](https://semaphoreci.com/docs/ubuntu-1804.html#how-to-upgrade).
___

If you need to create a SQLite database manually, you can use the following
command:

```bash
# create database 'test_database.db'
sqlite3 test_database.db ""

# create database 'test_database.db' and table 'posts'
sqlite3 test_database.db "create table posts(title varchar(50));"
```

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.
