---
layout: post
title: MySQL
category: Databases
---

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

Please note that all MySQL database instances that are located on Semaphore VM contain no data! Therefore, if you want to test your applications using MySQL data, you should populate MySQL with the necessary data on your own.

List of all packages and versions is available on the [supported application stack](/docs/supported-stack.html) page.
