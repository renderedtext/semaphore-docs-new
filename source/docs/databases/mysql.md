---
layout: post
title: MySQL
category: Databases
---

This document contains information related to projects based on Ubuntu 14.04 image. 
If you are using Ubuntu 18.04 image for your projects please refer to [this page](https://semaphoreci.com/docs/ubuntu-1804.html). 

If you are using Ubuntu 14.04 image and you want to switch to Ubuntu 18.04 be sure to check our [migration guide](https://semaphoreci.com/docs/ubuntu-1804.html#how-to-use-new-platform).
___

Credentials for using MySQL are available in environment variables listed below:

<table class="table table-striped table-bordered">
  <thead>
    <tr>
      <th>Name</th>
      <th>Value</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>DATABASE_MYSQL_USERNAME</td>
      <td>root</td>
    </tr>
    <tr>
      <td>DATABASE_MYSQL_PASSWORD</td>
      <td>semaphoredb</td>
    </tr>
  </tbody>
</table>

If you need to create a MySQL database manually, you can use the following
command:

```bash
mysql -u $DATABASE_MYSQL_USERNAME -p$DATABASE_MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS test_db;"
```

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.
