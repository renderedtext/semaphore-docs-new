---
layout: post
title: MongoDB
category: Databases
---

This document contains information related to projects based on the Ubuntu 14.04 image. 
If you are using the Ubuntu 18.04 image for your projects, please refer to [this page](https://semaphoreci.com/docs/ubuntu-1804.html). 

If you are using the Ubuntu 14.04 image and you want to switch to Ubuntu 18.04, be sure to check our [upgrade guide](https://semaphoreci.com/docs/ubuntu-1804.html#how-to-upgrade).
___

[MongoDB](https://www.mongodb.org/) doesn't provide a command to create a "database".

Actually, you don’t need to create it manually, because, MongoDB will create it
on the fly, during the first time you save the value into the defined collection
(or table in SQL), and database.

If your project requires multiple databases you can read more about [using
Postgres, MongoDB and
Redis](/docs/how-to-use-postgres-mongodb-and-redis-on-one-project.html) on one project.

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.
