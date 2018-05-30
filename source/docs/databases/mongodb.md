---
layout: post
title: MongoDB
category: Databases
---

You can find out the version of MongoDB server you are using by executing `mongod -version`.

[MongoDB](https://www.mongodb.org/) doesn't provide a command to create a "database".

Actually, you don’t need to create it manually, because, MongoDB will create it
on the fly, during the first time you save the value into the defined collection
(or table in SQL), and database. This also means that any typos will go unnoticed.

If your project requires multiple databases you can read more about [using
Postgres, MongoDB and
Redis](/docs/how-to-use-postgres-mongodb-and-redis-on-one-project.html) on one project.

The list of all supported packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.
